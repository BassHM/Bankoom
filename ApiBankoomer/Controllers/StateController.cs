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
            var sql = "INSERT INTO state (stateName, idCountry) VALUES (@name, @idcontri)";
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            //--------------------------------------------------------------------------------Al parecer necesitan llamarse diferente
            var result = await connection.ExecuteAsync(sql, new { name = postState.stateName, idcontri = postState.idCountry });
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
        [HttpGet]
        [Route("GetStates/{idCountry}")]
        public async Task<IActionResult> GetStates(int idCountry)
        {
            var sql = "SELECT * FROM state where idCountry = @idCountry";
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            var state = await connection.QueryAsync<GetStates>(sql,new { idCountry });
            //If there is no body in the response, return 404
            if (state == null)
                return NotFound();
            return Ok(state);
        }

        [HttpDelete]
        [Route("DeleteState/{idState}")]
        public async Task<IActionResult> DeleteState(int idState)
        {
            var sql = "DELETE FROM state WHERE idState = @idState";
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            var result = await connection.ExecuteAsync(sql, new { idState });
            //Si las filas afectadas es mayor a 0 entonces ok, si no pues un bad request
            return result > 0 ? Ok() : BadRequest();
        }
    }
}
