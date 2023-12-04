using Dapper;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ApiBankoomer.Models;
using System.Collections;
using System.Data;

namespace ApiBankoomer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private MySQLConnectorData.MySQLConfig _connectionString;
        public AccountController(MySQLConnectorData.MySQLConfig connectionString)
        {
            _connectionString = connectionString;
        }

        [HttpGet]
        [Route("GetCuentas/{idUser}")]
        public async Task<IActionResult> GetCuentas(string idUser)
        {
            var sql = "select case when accountName != '' then accountName else concat(typeOfAccountDescription, ' (', idAccount, ')') end as nombre, idAccount as cuenta, balance, typeOfAccountDescription as cuentaTipo, idCurrencyIso4217 as monedaIsoCode from account " +
                "join typeofaccount on typeofaccount.idTypeOfAccount = account.idTypeOfAccount " +
                "where idUser = @idUser";
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            var resultado = await connection.QueryAsync<Models.GetAccount>(sql, new { idUser });
            if (resultado == null)
                return NotFound();
            return Ok(resultado);
        }
        [HttpGet]
        [Route("GetCuenta/{idAccount}")]
        public async Task<IActionResult> GetCuenta(string idAccount)
        {
            var sql = "select case when accountName != '' then accountName else concat(typeOfAccountDescription, ' (', idAccount, ')') end as nombre, idAccount as cuenta, balance, typeOfAccountDescription as cuentaTipo, typeofaccount.idCurrencyIso4217 as monedaIsoCode, currencyName as nombreMoneda " +
                "from account " +
                "join typeofaccount on typeofaccount.idTypeOfAccount = account.idTypeOfAccount " +
                "join currency on currency.idCurrencyIso4217 = typeofaccount.idCurrencyIso4217 " +
                "where idAccount = @idAccount";
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            var resultado = await connection.QueryFirstAsync<Models.GetAccount>(sql, new { idAccount });
            if (resultado == null)
                return NotFound();
            return Ok(resultado);

        }
        [HttpGet]
        [Route("GetUltimosMovimientos/{idAccount}")]
        public async Task<IActionResult> GetUltimosMovimientos(string idAccount)
        {
            var sql = "call ultimosMovimientos(@idAccount)";
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            var resultado = await connection.QueryAsync<Models.Movimientos>(sql, new { idAccount });
            return Ok(resultado);
        }
        [HttpGet]
        [Route("GetHomeInfo/{idUser}")]
        public async Task<IActionResult> GetHomeInfo(string idUser)
        {
            var sql = "call homeInfo(@idUser)";
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            var resultado = await connection.QueryFirstAsync<Models.HomeInfo>(sql, new { idUser });
            return Ok(resultado);
        }
        [HttpGet]
        [Route("GetTypesOfAccount")]
        public async Task<IActionResult> GetTypesOfAccount()
        {
            var sql = "select * from typeOfAccount toa join currency c on c.idCurrencyIso4217 = toa.idCurrencyIso4217"; // Fixed the parameter names
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            var response = await connection.QueryAsync(sql); // Added type parameter to QueryFirstOrDefaultAsync
            return Ok(response);
        }
        [HttpGet]
        [Route("GetTypeOfAccount/{idTypeOfAccount}")]
        public async Task<IActionResult> GetTypeOfAccount(int idTypeOfAccount)
        {
            var sql = "select * from typeOfAccount toa join currency c on c.idCurrencyIso4217 = toa.idCurrencyIso4217 where idTypeOfAccount = @idTypeOfAccount"; // Fixed the parameter names
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            var response = await connection.QueryFirstAsync(sql, new { idTypeOfAccount }); // Added type parameter to QueryFirstOrDefaultAsync
            return Ok(response);
        }
        [HttpPost]
        [Route("PostNewAccount")]
        public async Task<IActionResult> PostNewAccount([FromBody] newAccount model)
        {
            var sql = "insert into account(idStatusOfAccount, dateOfCreation, idUser, balance, idTypeOfAccount, accountName) values(1, curdate(), @idUser, @montoInicial, @idTipoDeCuenta, @nombre)"; // Fixed the parameter names
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            var affectedRows = await connection.ExecuteAsync(sql, model); // Added type parameter to QueryFirstOrDefaultAsync
            return affectedRows == 1 ? Ok() : BadRequest();
        }
        [HttpPost]
        [Route("EstadoDeCuenta")]
        public async Task<IActionResult> EstadoDeCuenta([FromBody] estadoDeCuenta model)
        {
            using var connection = new MySqlConnection(_connectionString.ConnectionString);

            string qInfoUsuario = "SELECT concat(u.name, ' ', lastName, ' ', secondLastName) as name, email, phoneNumber, curp, concat(adress, ', ', postalCode, '. ', s.StateName, ', ', c.countryName, '.') as adress FROM user u join state s on u.idState = s.idState join country c on c.idCountry = s.idCountry where idUser = @idUser;";
            var infoUsuario = await connection.QueryAsync(qInfoUsuario, model);
            string qInfoCuenta = "select case when accountName != '' then accountName else concat(typeOfAccountDescription, ' (', idAccount, ')') end as nombre, idAccount as cuenta, balance, typeOfAccountDescription as cuentaTipo, typeofaccount.idCurrencyIso4217 as monedaIsoCode, currencyName as nombreMoneda from account join typeofaccount on typeofaccount.idTypeOfAccount = account.idTypeOfAccount join currency on currency.idCurrencyIso4217 = typeofaccount.idCurrencyIso4217 where idAccount = @idAccount;";
            var infoCuenta = await connection.QueryAsync(qInfoCuenta, model);
            string qTransferencias = " SELECT 'Transferencias realizadas y recibidas' as tipo, concept AS concepto, DATE_FORMAT(dateOfTransfer, '%d/%m/%Y %H:%i') AS fechaMovimiento, case when idAccountSender = @idAccount then round((-1*amount)/(select valueInPesos from currency c join typeOfAccount toa on toa.idCurrencyIso4217 = c.idCurrencyIso4217 join account a on a.idTypeOfAccount = toa.idTypeOfAccount where a.idAccount = @idAccount),2) else round(amount/(select valueInPesos from currency c join typeOfAccount toa on toa.idCurrencyIso4217 = c.idCurrencyIso4217 join account a on a.idTypeOfAccount = toa.idTypeOfAccount where a.idAccount = @idAccount),2) end AS monto FROM transfer WHERE idAccountSender = @idAccount or idAccountReceiver = @idAccount;";
            var transferencias = await connection.QueryAsync(qTransferencias, model);
            string qPagos = "SELECT 'Pago a servicio' as tipo, concat(oa.accountName) as concepto, DATE_FORMAT(p.dateOfPayment, '%d/%m/%Y %H:%i') AS fechaMovimiento, round((-1*pp.amount)/(select valueInPesos from currency c join typeOfAccount toa on toa.idCurrencyIso4217 = c.idCurrencyIso4217 join account a on a.idTypeOfAccount = toa.idTypeOfAccount where a.idAccount = @idAccount),2) as monto FROM payment p join periodicPayment pp on pp.idPeriodicPayment = p.idPeriodicPayment join organizationAccount oa on oa.idOrganizationAccount = pp.idOrganizationAccount join account a on a.idAccount = pp.idAccount where a.idAccount = @idAccount;";
            var pagos = await connection.QueryAsync(qPagos, model);
            return infoUsuario != null ? Ok(new { infoUsuario, infoCuenta, transferencias, pagos }) : NotFound();
        }
    }
}
        