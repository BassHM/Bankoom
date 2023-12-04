using ApiBankoomer.Models;
using Dapper;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using System.Data.Common;

namespace ApiBankoomer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrganizationController : ControllerBase
    {
        private MySQLConnectorData.MySQLConfig _connectionString;
        public OrganizationController(MySQLConnectorData.MySQLConfig connectionString)
        {
            _connectionString = connectionString;
        }

        [HttpGet]
        [Route("GetOrganizations")]
        public async Task<IActionResult> GetOrganizations()
        {
            var sql = "SELECT * FROM bankoomorganization.organization";
            var connection = new MySqlConnection(_connectionString.ConnectionString);

            var organizations = await connection.QueryAsync<Organization>(sql);

            return Ok(organizations);
        }
        [HttpPost]
        [Route("InsertOrganization")]
        public async Task<IActionResult> InsertOrganization([FromBody] Organization organization)
        {
            var sql = "INSERT INTO bankoomorganization.organization (idOrganization, password, comercialName, idState) " +
                      "VALUES (@IdOrganization, @Password, @ComercialName, @IdState)";
            var connection = new MySqlConnection(_connectionString.ConnectionString);

            var result = await connection.ExecuteAsync(sql, organization);

            return result > 0 ? Ok() : BadRequest();
        }
        [HttpGet]
        [Route("GetOrganizationAccounts/{idOrganization}")]
        public async Task<IActionResult> GetOrganizationAccounts(string idOrganization)
        {
            var sql = "SELECT * FROM bankoomorganization.organizationaccount where idOrganization = @idOrganization";
            var connection = new MySqlConnection(_connectionString.ConnectionString);

            var organizationAccounts = await connection.QueryAsync<OrganizationAccount>(sql, new { idOrganization });

            return Ok(organizationAccounts);
        }

        [HttpPost]
        [Route("InsertOrganizationAccount")]
        public async Task<IActionResult> InsertOrganizationAccount([FromBody] insertAccount organizationAccount)
        {
            var sql = "INSERT INTO bankoomorganization.organizationaccount(idOrganization, accountName, balance, Active) " +
                      "VALUES (@IdOrganization, @AccountName, @Balance, @Active)";
            var connection = new MySqlConnection(_connectionString.ConnectionString);

            var result = await connection.ExecuteAsync(sql, organizationAccount);

            return result > 0 ? Ok() : BadRequest();
        }
        [HttpPut]
        [Route("DeactivateOrganizationAccount/{id}/{active}")]
        public async Task<IActionResult> DeactivateOrganizationAccount(int id, int active)
        {
            var sql = "UPDATE bankoomorganization.organizationaccount SET Active = @Active WHERE idOrganizationAccount = @Id";
            var connection = new MySqlConnection(_connectionString.ConnectionString);
            var result = await connection.ExecuteAsync(sql, new { Id = id, Active = active});

            return result > 0 ? Ok() : BadRequest();
        }
    }
}
