using System;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web.Http;

namespace Dummy.WebApi.Controllers
{
    public class StatusController : ApiController
    {
        public dynamic Get()
        {
            return InternalServerError(new Exception("dead john"));

            var version = System.Reflection.Assembly.GetExecutingAssembly().GetName().Version;
            var localIPs = Dns.GetHostAddresses(Dns.GetHostName()).Select(x=>x.ToString());
            return new
            {
                Status = "Ok",
                Environment = ConfigurationManager.AppSettings["Environment"],
                Environment.MachineName,
                Version = $"{version.Major}.{version.Minor}.{version.Build}.{version.Revision}",
                Hostname = Dns.GetHostName(),
                IpAddresses = localIPs,
                Demo = "Hello"
            };
        }
    }
}
