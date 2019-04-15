using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ProcessScheduling.Startup))]
namespace ProcessScheduling
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
