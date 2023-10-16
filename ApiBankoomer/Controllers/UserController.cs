using Dapper;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;

namespace ApiBankoomer.Controllers
{
    public class UserController : ControllerBase
    {
        private MySQLConnectorData.MySQLConfig _connectionString;
        public UserController(MySQLConnectorData.MySQLConfig connectionString)
        {
            _connectionString = connectionString;
        }

        [HttpGet]
        [Route("GerUsers")]
        public async Task<IActionResult> GetUsers()
        {
            var sql = "SELECT * FROM user";
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            var users = await connection.QueryAsync<Models.User>(sql);
            return Ok(users);
        }
    }
}
