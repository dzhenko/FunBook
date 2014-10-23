using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FunBook.WebForms.FunAreaPages.PrivateFunDetails
{
    public partial class ManageFun : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.PanelJoke.Visible = false;
            this.PanelPicture.Visible = false;
            this.PanelLink.Visible = false;
        }

        protected void RadioButtonJoke_CheckedChanged(object sender, EventArgs e)
        {
            ShowSelectedDrinks();
        }

        protected void RadioButtonLink_CheckedChanged(object sender, EventArgs e)
        {
            ShowSelectedDrinks();
        }

        protected void RadioButtonPicture_CheckedChanged(object sender, EventArgs e)
        {
            ShowSelectedDrinks();
        }

        private void ShowSelectedDrinks()
        {
            if (this.RadioButtonJoke.Checked)
            {
                this.PanelJoke.Visible = true;
                this.PanelLink.Visible = false;
                this.PanelPicture.Visible = false;
            }

            if (this.RadioButtonLink.Checked)
            {
                this.PanelJoke.Visible = false;
                this.PanelLink.Visible = true;
                this.PanelPicture.Visible = false;
            }

            if (this.RadioButtonPicture.Checked)
            {
                this.PanelJoke.Visible = false;
                this.PanelLink.Visible = false;
                this.PanelPicture.Visible = true;
            }
        }
    }
}