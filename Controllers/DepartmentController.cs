using Enterprise_UI.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Npgsql;
using System.Data;

namespace Enterprise_UI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DepartmentController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        public DepartmentController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        //api methods
        [HttpGet]
        public string Get()
        {
            string query = @"
                select DepartmentId as ""DepartmentId"", DepartmentName as ""DepartmentName""
                from Department
            ";

            DataTable table = new DataTable();
            string sqlDataSources = _configuration.GetValue<string>("ConnectionString:EnterpriseDb");
            NpgsqlDataReader reader;
            using (NpgsqlConnection con = new NpgsqlConnection(sqlDataSources))
            {
                con.Open();
                using(NpgsqlCommand cmd = new NpgsqlCommand(query, con))
                {
                    reader = cmd.ExecuteReader();
                    table.Load(reader);

                    reader.Close();
                    con.Close();
                }
            }

            string json = Newtonsoft.Json.JsonConvert.SerializeObject(table); 

            return json;
        }

        [HttpPost]
        public string Post(Department dep)
        {
            string query = @"
                insert into Department(DepartmentName)
                values (@DepartmentName)
            ";

            DataTable table = new DataTable();
            string sqlDataSources = _configuration.GetValue<string>("ConnectionString:EnterpriseDb");
            NpgsqlDataReader reader;
            using (NpgsqlConnection con = new NpgsqlConnection(sqlDataSources))
            {
                con.Open();
                using (NpgsqlCommand cmd = new NpgsqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@DepartmentName", dep.DepartmentName);
                    reader = cmd.ExecuteReader();
                    table.Load(reader);

                    reader.Close();
                    con.Close();
                }
            }

            string json = Newtonsoft.Json.JsonConvert.SerializeObject("Added Successfully");

            return json;
        }

        [HttpPut]
        public string Put(Department dep)
        {
            string query = @"
                update Department
                set DepartmentName = @DepartmentName
                where DepartmentId = @DepartmentId
            ";

            DataTable table = new DataTable();
            string sqlDataSources = _configuration.GetValue<string>("ConnectionString:EnterpriseDb");
            NpgsqlDataReader reader;
            using (NpgsqlConnection con = new NpgsqlConnection(sqlDataSources))
            {
                con.Open();
                using (NpgsqlCommand cmd = new NpgsqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@DepartmentName", dep.DepartmentName);
                    cmd.Parameters.AddWithValue("@DepartmentId", dep.DepartmentId);
                    reader = cmd.ExecuteReader();
                    table.Load(reader);

                    reader.Close();
                    con.Close();
                }
            }

            string json = Newtonsoft.Json.JsonConvert.SerializeObject("Updated Successfully");

            return json;
        }

        [HttpDelete("{id}")]
        public string Delete(int id)
        {
            string query = @"
                delete from Department
                where DepartmentId = @DepartmentId
            ";

            DataTable table = new DataTable();
            string sqlDataSources = _configuration.GetValue<string>("ConnectionString:EnterpriseDb");
            NpgsqlDataReader reader;
            using (NpgsqlConnection con = new NpgsqlConnection(sqlDataSources))
            {
                con.Open();
                using (NpgsqlCommand cmd = new NpgsqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@DepartmentId", id);
                    reader = cmd.ExecuteReader();
                    table.Load(reader);

                    reader.Close();         
                    con.Close();
                }
            }

            string json = Newtonsoft.Json.JsonConvert.SerializeObject("Deleted Successfully");

            return json;
        }
    }
}

