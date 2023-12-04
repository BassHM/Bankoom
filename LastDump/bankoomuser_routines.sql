-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: bankoomuser
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping events for database 'bankoomuser'
--

--
-- Dumping routines for database 'bankoomuser'
--
/*!50003 DROP PROCEDURE IF EXISTS `homeInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `homeInfo`(_idUser varchar(30))
BEGIN
	select -1*sum(case when monto<0 then monto end) as expenses, sum(case when monto>=0 then monto end) as income, (select name from user where idUser = _idUser) as nombre 
	from (
		SELECT case when idAccountSender = a.idAccount then -1*t.amount else t.amount end AS monto 
		FROM transfer t join account a on a.idAccount = t.idAccountSender or a.idAccount = t.idAccountReceiver 
		where a.idUser = _idUser 
		union all (
			select (-1*count(p.idPayment)*pp.amount) as monto
			from payment p
			join periodicpayment pp on pp.idPeriodicPayment = p.idPeriodicPayment
			join account a on a.idAccount = pp.idAccount
			where a.iduser= _idUser
			group by pp.amount
		)
	) as subQuery;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `notificaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `notificaciones`(_idUser varchar(30))
BEGIN
	select * from (
		SELECT concept AS concepto, DATE_FORMAT(dateOfTransfer, '%d/%m/%Y %H:%i') AS fechaMovimiento, case when idAccountSender = a.idAccount then (-1*amount) else amount end AS monto 
		FROM transfer 
        join account a on a.idAccount = idAccountSender or a.idAccount = idAccountReceiver
		WHERE a.idUser = _idUser
		union all (
			/* Después los pagos */
			SELECT concat('Pago: ', oa.accountName) as concepto, DATE_FORMAT(p.dateOfPayment, '%d/%m/%Y %H:%i') AS fechaMovimiento, (-1*pp.amount) as monto
			FROM payment p
			join periodicPayment pp on pp.idPeriodicPayment = p.idPeriodicPayment
			join organizationAccount oa on oa.idOrganizationAccount = pp.idOrganizationAccount
			join account a on a.idAccount = pp.idAccount
			where a.idUser = _idUser
		)
    ) as Subquery 
	order by fechaMovimiento desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `signInUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `signInUser`(_idUser varchar(15), _password varchar(45), _name varchar(45), _lastName varchar(45), _secondLastName varchar(45), _dateOfBirth varchar(10), _genero varchar(1), _curp varchar(20), _phoneNumber varchar(10), _address varchar(45), _postalCode varchar(5), _email varchar(45), _idState int)
BEGIN
	START TRANSACTION;
   INSERT INTO user(idUser,password, name,lastName,secondLastName,dateOfBirth,genero,curp,phoneNumber,adress,postalCode,email,idState) values(_idUser, _password, _name, _lastName, _secondLastName, STR_TO_DATE(_dateOfBirth, '%d/%m/%Y'),_genero,_curp, _phoneNumber, _address, _postalCode, _email, _idState);
   INSERT INTO account(idStatusOfAccount, dateOfCreation, idUser, balance, idTypeOfAccount) values (1, curdate(), _idUser, 0, 1);
   COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `signPeriodic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `signPeriodic`(_idOrganizationAccount int, _idAccount int, _amount decimal(9,2))
BEGIN
	
	set @amountEnDestino = (select round(_amount/valueInPesos,2) from currency c join typeOfAccount toa on toa.idCurrencyIso4217 = c.idCurrencyIso4217
		join account a on a.idTypeOfAccount = toa.idTypeOfAccount
		where a.idAccount = _idAccount);
	if (select balance from account where idAccount = _idAccount) - @amountEnDestino <0 then
		select 'No cuentas con el saldo suficiente para suscribirte a este servicio' as mensaje;
	else
		set @diaHoy = (SELECT DAY(curdate()));
		insert into periodicPayment(paymentDay, amount, idOrganizationAccount, idAccount) values (@diaHoy, _amount, _idOrganizationAccount, _idAccount);
        set @idPeriodicPayment = (Select max(idPeriodicPayment) from periodicPayment where paymentDay =  @diaHoy and amount = _amount and idOrganizationAccount = _idOrganizationAccount and idAccount = _idAccount);
        
        insert into payment(idPeriodicPayment, dateOfPayment) values (@idPeriodicPayment, NOW());
        update account set balance = balance - @amountEnDestino where idAccount = _idAccount;
        select 'Suscripción creada correctamente :D' as mensaje; 
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `transfer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `transfer`(_idAccountSender int, _idAccountReceiver int, _amount decimal(7,2), _concept varchar(1000))
BEGIN
 -- Validate that the balance of the sender account will not be negative
	IF (SELECT balance FROM account WHERE idAccount = _idAccountSender) - _amount < 0 THEN
		SELECT 'Saldo insuficiente' AS message;
	ELSE IF (SELECT count(idAccount) FROM account WHERE idAccount = _idAccountReceiver) = 0 THEN
		SELECT 'La cuenta destino no existe' AS message;
	else
		/*A la cuenta original se le va a restar el monto original*/
		UPDATE account SET balance = balance - _amount WHERE idAccount = _idAccountSender;
		
		/*En la tabla transferir se guarda el monto en pesos*/
		set @amountEnPesos = (select round(_amount*valueInPesos,2) from currency c join typeOfAccount toa on toa.idCurrencyIso4217 = c.idCurrencyIso4217
		join account a on a.idTypeOfAccount = toa.idTypeOfAccount
		where a.idAccount = _idAccountSender);
		
		INSERT INTO transfer(idAccountSender, idAccountReceiver, amount, concept, dateOfTransfer) VALUES (_idAccountSender, _idAccountReceiver, @amountEnPesos, SUBSTRING(_concept, 1, 20), NOW());
		
		/*En la cuenta destino se guarda en la moneda que le corresponde*/
		set @amountEnMonedaDestino = (select round(@amountEnPesos/valueInPesos,2) from currency c join typeOfAccount toa on toa.idCurrencyIso4217 = c.idCurrencyIso4217
		join account a on a.idTypeOfAccount = toa.idTypeOfAccount
		where a.idAccount = _idAccountReceiver);
		
		UPDATE account SET balance = balance + @amountEnMonedaDestino WHERE idAccount = _idAccountReceiver;
		
		SELECT 'Transferencia Realizada' AS message;
	END IF;
    End if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ultimosMovimientos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ultimosMovimientos`(_idAccount int)
BEGIN
	set @amountEnPesos = (select valueInPesos from currency c join typeOfAccount toa on toa.idCurrencyIso4217 = c.idCurrencyIso4217
		join account a on a.idTypeOfAccount = toa.idTypeOfAccount
		where a.idAccount = _idAccount);
	select * from (
		SELECT concept AS concepto, DATE_FORMAT(dateOfTransfer, '%d/%m/%Y %H:%i') AS fechaMovimiento, case when idAccountSender = _idAccount then (-1*amount)/@amountEnPesos else amount/@amountEnPesos end AS monto 
		FROM transfer 
		WHERE idAccountSender = _idAccount or idAccountReceiver = _idAccount
		union all (
			/* Después los pagos */
			SELECT concat('Pago: ', oa.accountName) as concepto, DATE_FORMAT(p.dateOfPayment, '%d/%m/%Y %H:%i') AS fechaMovimiento, (-1*pp.amount)/@amountEnPesos as monto
			FROM payment p
			join periodicPayment pp on pp.idPeriodicPayment = p.idPeriodicPayment
			join organizationAccount oa on oa.idOrganizationAccount = pp.idOrganizationAccount
			join account a on a.idAccount = pp.idAccount
			where a.idAccount = _idAccount
		)
    ) as Subquery 
	order by fechaMovimiento desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-04  2:51:14
