using Dapper;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using System.Collections;
using System.Data;

namespace ApiBankoomer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
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
            var users = await connection.QueryAsync<string>(sql, new { model.idUser, model.password });
            return users.Any() ? Ok() : NotFound();
        }
        [HttpPost]
        [Route("SignInUser")]
        public async Task<IActionResult> SignInUser([FromBody] Models.SignInUser model)
        {
            var sql = "call signInUser(@idUser, @password, @name, @lastName, @secondLastName, @dateOfBirth,@genero,@curp, @phoneNumber, @address, @postalCode, @email, @idState)";
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            int affectedRows = await connection.ExecuteAsync(sql, model);
            return affectedRows!=2 ? Ok() : NotFound();
        }
    }
}
