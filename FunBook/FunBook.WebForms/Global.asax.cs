namespace FunBook.WebForms
{
    using System;
    using System.Linq;
    using System.Web;
    using System.Web.Optimization;
    using System.Web.Routing;

    using FunBook.WebForms.DataGenerators;

    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            DataConfig.RegisterData();
        }
    }
}