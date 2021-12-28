using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aspx_win_docker
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            var Container_Name = System.Net.Dns.GetHostName(); // get container id
            container_Name.InnerText = "Container ID: " + Container_Name;
        }
    }
}