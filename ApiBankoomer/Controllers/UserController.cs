using Dapper;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using System.Collections;
using System.Data;

namespace ApiBankoomer.Controllers
{
    public class UserController : ControllerBase
    {
        private MySQLConnectorData.MySQLConfig _connectionString;
        public UserController(MySQLConnectorData.MySQLConfig connectionString)
        {
            _connectionString = connectionString;
        }

        [HttpPost]
        [Route("UserLogin")]
        public async Task<IActionResult> PostUserLogin([FromBody] Models.UserLogin model)
        {
            var sql = "SELECT idUser FROM user where idUser = @idUser and password = @password";
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            var users = await connection.QueryAsync<int>(sql, new { model.idUser, model.password });
            return users.Any() ? Ok() : NotFound();
        }
        [HttpPost]
        [Route("SignInUser")]
        public async Task<IActionResult> SignInUser([FromBody] Models.SignInUser model)
        {
            var sql = "INSERT INTO user(idUser,password, name,lastName,secondLastName,dateOfBirth,curp,phoneNumber,adress,postalCode,email,idState) values(@idUser, @password, @name, @lastName, @secondLastName, @dateOfBirth, @curp, @phoneNumber, @address, @postalCode, @email, @idState)";
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            int affectedRows = await connection.ExecuteAsync(sql, model);
            return affectedRows == 1 ? Ok() : NotFound();
        }
    }
}
