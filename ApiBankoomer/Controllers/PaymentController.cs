using ApiBankoomer.Models;
using Dapper;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using System.Collections;
using System.Data;

namespace ApiBankoomer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PaymentController : ControllerBase
    {
        private MySQLConnectorData.MySQLConfig _connectionString;
        public PaymentController(MySQLConnectorData.MySQLConfig connectionString)
        {
            _connectionString = connectionString;
        }

        [HttpGet]
        [Route("GetPeriodicPayments")]
        public async Task<IActionResult> GetPeriodicPayments()
        {
            var sql = "SELECT * from organizationAccount";
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            var response = await connection.QueryAsync(sql);
            return Ok(response);
        }
        [HttpPost]
        [Route("SignToPeriodic")]
        public async Task<IActionResult> SignToPeriodic([FromBody] Models.SignPeriodicPayment model)
        {
            var sql = "call signPeriodic(@idOrganizationAccount, @idAccount, @amount)";
            using var connection = new MySqlConnection(_connectionString.ConnectionString);
            string message = await connection.QueryFirstAsync<string>(sql, model );
            if (message == "Suscripción creada correctamente :D")
                return Ok(new TransferResponse { Message = message });
            else
                return BadRequest(new TransferResponse { Message = message });
        }
    }
}
