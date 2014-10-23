using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestASCX.HoverDetails
{
    public partial class HoverDetails : System.Web.UI.UserControl
    {
        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (this.ItemsToShow != null)
            {
                this.HoverDetailsView.PageIndex = int.Parse(this.HiddenHoveredItemId.Value);
                if (this.HoverDetailsView.DataSource == null)
                {
                    this.HoverDetailsView.DataSource = this.ItemsToShow.ToList();
                    this.DataBind();
                }
            }

        }

        public IEnumerable<object> ItemsToShow { get; set; }
    }
}