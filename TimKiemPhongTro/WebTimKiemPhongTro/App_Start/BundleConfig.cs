using System.Web;
using System.Web.Optimization;

namespace WebTimKiemPhongTro
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            /*bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));*/

            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/assets/js/jquery-2.2.0.min.js",
                        "~/assets/js/popper.min.js",
                        "~/assets/js/bootstrap.min.js",
                        "~/assets/js/jquery.selectBox.js",
                        "~/assets/js/rangeslider.js",
                        "~/assets/js/jquery.magnific-popup.min.js",
                        "~/assets/js/jquery.filterizr.js",
                        "~/assets/js/wow.min.js",
                        "~/assets/js/backstretch.js",
                        "~/assets/js/jquery.countdown.js",
                        "~/assets/js/jquery.scrollUp.js",
                        "~/assets/js/particles.min.js",
                        "~/assets/js/typed.min.js",
                        "~/assets/js/dropzone.js",
                        "~/assets/js/jquery.mb.YTPlayer.js",
                        "~/assets/js/leaflet.js",
                        "~/assets/js/leaflet-providers.js",
                        "~/assets/js/leaflet.markercluster.js",
                        "~/assets/js/slick.min.js",
                        "~/assets/js/maps.js",
                        "~/assets/js/ie-emulation-modes-warning.js",
                        "~/assets/js/app.js"));
            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css"));
        }
    }
}
