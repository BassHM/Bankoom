using Dapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Diagnostics.HealthChecks;
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
            return users.Any() ? Ok(users) : NotFound();
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
        [HttpGet]
        [Route("GetUserInfo/{idUser}")]
        public async Task<IActionResult> GetUserInfo(string idUser)
        {
            var sql = "SELECT concat(u.name, ' ', lastName, ' ', secondLastName) as name, "+
                "email, phoneNumber, curp, concat(adress, ', ', postalCode, '. ', s.StateName, ', ', c.countryName, '.') as adress "+
                "FROM user u join state s on u.idState = s.idState " +
                "join country c on c.idCountry = s.idCountry where idUser = @idUser";
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            var users = await connection.QueryFirstAsync(sql, new { idUser });
            return users != null ? Ok(users) : NotFound();
        }
        [HttpGet]
        [Route("GetNotificaciones/{idUser}")]
        public async Task<IActionResult> GetNotificaciones(string idUser)
        {
            var sql = "call notificaciones(@idUser)";
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            var response = await connection.QueryAsync(sql, new { idUser });
            return response != null ? Ok(response) : NotFound();
        }
    }
}
