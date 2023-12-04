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
    public class MoneyController : ControllerBase
    {
        private MySQLConnectorData.MySQLConfig _connectionString;
        public MoneyController(MySQLConnectorData.MySQLConfig connectionString)
        {
            _connectionString = connectionString;
        }

        [HttpPost]
        [Route("PostTransfer")]
        public async Task<IActionResult> PostTransfer([FromBody] PostTransfer model)
        {
            var sql = "call transfer(@cuentaOrigen, @cuentaDestino, @monto, @concepto)"; // Fixed the parameter names
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            var message = await connection.QueryFirstAsync<string>(sql, model); // Added type parameter to QueryFirstOrDefaultAsync
            if (message == "Transferencia Realizada")
                return Ok(new TransferResponse { Message = message });
            else
                return BadRequest(new TransferResponse { Message = message });
        }
    }
    public class TransferResponse
    {
        public string Message { get; set; }
    }
}
        