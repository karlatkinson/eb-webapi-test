using System;
using System.Configuration;
using System.Net;
using System.Web.Http;

namespace Dummy.WebApi.Controllers
{
    public class StatusController : ApiController
    {
        public dynamic Get()
        {
            var version = System.Reflection.Assembly.GetExecutingAssembly().GetName().Version;

            return new
            {
                Status = "Ok",
                Environment = ConfigurationManager.AppSettings["Environment"],
                Environment.MachineName,
                Version = $"{version.Major}.{version.Minor}.{version.Build}.{version.Revision}",
                Hostname = Dns.GetHostName()
            };
        }
    }
}
