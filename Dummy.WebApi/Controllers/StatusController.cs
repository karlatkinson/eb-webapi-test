using System;
using System.Configuration;
using System.Web.Http;

namespace Dummy.WebApi.Controllers
{
    public class StatusController : ApiController
    {
        public dynamic Get()
        {
            return new
            {
                Status = "Ok",
                Environment = ConfigurationManager.AppSettings["Environment"],
                Machine = Environment.MachineName
            };
        }
    }
}
