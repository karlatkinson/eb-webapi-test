using System;
using System.Configuration;
using System.Web.Http;

namespace Dummy.WebApi.Controllers
{
    public class StatusController : ApiController
    {
        public dynamic Get()
        {
            var version = System.Reflection.Assembly.GetExecutingAssembly().GetName().Version;

            return InternalServerError(new Exception("Oh no it went wrong"));

            return new
            {
                Status = "Ok",
                Environment = ConfigurationManager.AppSettings["Environment"],
                Environment.MachineName,
                Version = $"{version.Major}.{version.Minor}.{version.Build}.{version.Revision}"
            };
        }
    }
}
