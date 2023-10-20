using ApiBankoomer.Models;
using Dapper;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using System.Net.WebSockets;

namespace ApiBankoomer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CountryController : ControllerBase
    {
        private MySQLConnectorData.MySQLConfig _connectionString;
        public CountryController(MySQLConnectorData.MySQLConfig connectionString)
        {
            _connectionString = connectionString;
        }

        [HttpPost]
        [Route("PostCountry")]
        public async Task<IActionResult> PostCountry([FromBody] PostCountry postCountry)
        {
            var sql = "INSERT INTO country (countryName) VALUES (@name)";
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            var result = await connection.ExecuteAsync(sql, new { name = postCountry.countryName });
            //Si las filas afectadas es mayor a 0 entonces ok, si no pues un bad request
            return result > 0 ? Ok() : BadRequest();
        }

        [HttpGet]
        [Route("GetCountry/{idCountry}")]
        public async Task<IActionResult> GetCountry(int idCountry)
        {
            var sql = "SELECT * FROM country where idCountry = @idCountry";
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            var state = await connection.QueryFirstOrDefaultAsync<GetState>(sql, new { idCountry });
            //Si no hay respuesta entonces regresar un 404
            if (state == null)
                return NotFound();
            return Ok(state);
        }

        [HttpGet]
        [Route("GetCountrys")]
        public async Task<IActionResult> GetCountrys()
        {
            var sql = "SELECT * FROM country";
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            var state = await connection.QueryAsync<GetState>(sql);
            //Si no hay respuesta entonces regresar un 404 (not found)
            if (state == null)
                return NotFound();
            return Ok(state);
        }
        [HttpDelete]
        [Route("DeleteCountry/{idCountry}")]
        public async Task<IActionResult> DeleteCountry(int idCountry)
        {
            var sql = "DELETE FROM country WHERE idCountry = @idCountry";
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            var result = await connection.ExecuteAsync(sql, new { idCountry });
            //Si las filas afectadas es mayor a 0 entonces ok, si no pues un bad request
            return result > 0 ? Ok() : BadRequest();
        }
    }
}
