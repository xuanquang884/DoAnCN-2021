using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebTimKiemPhongTro.Startup))]
namespace WebTimKiemPhongTro
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
