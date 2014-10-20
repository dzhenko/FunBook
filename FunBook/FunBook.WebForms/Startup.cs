using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FunBook.WebForms.Startup))]
namespace FunBook.WebForms
{
    public partial class Startup 
    {
        public void Configuration(IAppBuilder app) 
        {
            ConfigureAuth(app);
        }
    }
}
