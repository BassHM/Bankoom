using ApiBankoomer.Models;
using Dapper;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;

namespace ApiBankoomer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StateController : ControllerBase
    {
        private MySQLConnectorData.MySQLConfig _connectionString;
        public StateController(MySQLConnectorData.MySQLConfig connectionString)
        {
            _connectionString = connectionString;
        }

        [HttpPost]
        [Route("PostState")]
        public async Task<IActionResult> PostState([FromBody] PostState postState)
        {
            var sql = "INSERT INTO state (stateName) VALUES (@name)";
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            var result = await connection.ExecuteAsync(sql, new { name = postState.stateName });
            return result > 0 ? Ok() : BadRequest();
        }

        [HttpGet]
        [Route("GetState/{idState}")]
        public async Task<IActionResult> GetState(int idState)
        {
            var sql = "SELECT * FROM state where idState = @idState";
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            var state = await connection.QueryFirstOrDefaultAsync<GetState>(sql, new { idState });
            //If there is no body in the response, return 404
            if (state == null)
                return NotFound();
            return Ok(state);
        }
    }
}
