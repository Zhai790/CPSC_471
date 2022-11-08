using Enterprise_UI.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Npgsql;
using System.Data;
using System.Globalization;

namespace Enterprise_UI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _env;
        public EmployeeController(IConfiguration configuration, IWebHostEnvironment env)
        {
            _configuration = configuration;
            _env = env;
        }

        //api methods
        [HttpGet]
        public string Get()
        {
            string query = @"
                select EmployeeId as ""EmployeeId"", 
                       EmployeeName as ""EmployeeName"", 
                       Department as ""Department"", 
                       to_char(DateOfJoining, 'YYYY-MM-DD') as ""DateOfJoining"", 
                       PhotoFileName as ""PhotoFileName""
                from Employee
            ";

            DataTable table = new DataTable();
            string sqlDataSources = _configuration.GetValue<string>("ConnectionString:EnterpriseDb");
            NpgsqlDataReader reader;
            using (NpgsqlConnection con = new NpgsqlConnection(sqlDataSources))
            {
                con.Open();
                using (NpgsqlCommand cmd = new NpgsqlCommand(query, con))
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
        public string Post(Employee emp)
        {
            string query = @"
                insert into Employee(EmployeeName, Department, DateOfJoining, PhotoFileName)
                values (@EmployeeName, @Department, @DateOfJoining, @PhotoFileName)
            ";

            DataTable table = new DataTable();
            string sqlDataSources = _configuration.GetValue<string>("ConnectionString:EnterpriseDb");
            NpgsqlDataReader reader;
            using (NpgsqlConnection con = new NpgsqlConnection(sqlDataSources))
            {
                con.Open();
                using (NpgsqlCommand cmd = new NpgsqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EmployeeName", emp.EmployeeName);
                    cmd.Parameters.AddWithValue("@Department", emp.Department);
                    cmd.Parameters.AddWithValue("@DateOfJoining", Convert.ToDateTime(emp.DateOfJoining));
                    cmd.Parameters.AddWithValue("@PhotoFileName", emp.PhotoFileName);
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
        public string Put(Employee emp)
        {
            string query = @"
                update Employee
                set EmployeeName = @EmployeeName,
                    Department = @Department,
                    DateOfJoining = @DateOfJoining,
                    PhotoFileName = @PhotoFileName
                where EmployeeId = @EmployeeId
            ";

            DataTable table = new DataTable();
            string sqlDataSources = _configuration.GetValue<string>("ConnectionString:EnterpriseDb");
            NpgsqlDataReader reader;
            using (NpgsqlConnection con = new NpgsqlConnection(sqlDataSources))
            {
                con.Open();
                using (NpgsqlCommand cmd = new NpgsqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EmployeeId", emp.EmployeeId);
                    cmd.Parameters.AddWithValue("@EmployeeName", emp.EmployeeName);
                    cmd.Parameters.AddWithValue("@Department", emp.Department);
                    cmd.Parameters.AddWithValue("@DateOfJoining", Convert.ToDateTime(emp.DateOfJoining));
                    cmd.Parameters.AddWithValue("@PhotoFileName", emp.PhotoFileName);
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
                delete from Employee
                where EmployeeId = @EmployeeId
            ";

            DataTable table = new DataTable();
            string sqlDataSources = _configuration.GetValue<string>("ConnectionString:EnterpriseDb");
            NpgsqlDataReader reader;
            using (NpgsqlConnection con = new NpgsqlConnection(sqlDataSources))
            {
                con.Open();
                using (NpgsqlCommand cmd = new NpgsqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EmployeeId", id);
                    reader = cmd.ExecuteReader();
                    table.Load(reader);

                    reader.Close();
                    con.Close();
                }
            }

            string json = Newtonsoft.Json.JsonConvert.SerializeObject("Deleted Successfully");

            return json;
        }

        [Route("SaveFile")] //custom route name
        [HttpPost]
        public string SaveFile()
        {
            try
            {
                var httpReq = Request.Form;
                var postedFile = httpReq.Files[0];
                string filename = postedFile.FileName;
                var physicalPath = _env.ContentRootPath + "/Photos/" + filename;

                using(var stream = new FileStream(physicalPath, FileMode.Create))
                {
                    postedFile.CopyTo(stream);
                }

                return Newtonsoft.Json.JsonConvert.SerializeObject(filename);
            }
            catch (Exception)
            {

                return Newtonsoft.Json.JsonConvert.SerializeObject("default.png");
            }
        }
    }
}
