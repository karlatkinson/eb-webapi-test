using Microsoft.ApplicationInsights.Extensibility;
using System.Net.Http.Headers;
using System.Web.Http;

namespace Dummy.WebApi
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {

            TelemetryConfiguration.Active.InstrumentationKey = "997c158b-12bd-4660-b457-39602b947028";

            // Web API configuration and services
            config.Formatters.JsonFormatter.SupportedMediaTypes.Add(new MediaTypeHeaderValue("text/html"));

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "{controller}/{id}",
                defaults: new { controller = "Status", id = RouteParameter.Optional }
            );
        }
    }
}
