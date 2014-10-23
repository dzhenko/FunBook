using FunBook.Data;
using FunBook.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FunBook.WebForms.FunAreaPages.PrivateFunDetails.EditForms
{
    public partial class LinkEdit : System.Web.UI.Page
    {
        private IFunBookData data;

        protected void Page_Init(object sender, EventArgs e)
        {
            this.data = new FunBookData();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var link = GetCurrentLink();

                this.inputTitleLink.Value = link.Title;
                this.urlLink.Value = link.URL;

                if (link.IsAnonymous)
                {
                    this.isAnonymous.Checked = true;
                }

                this.DataBind();
            }
        }

        protected void linkEdit_Click(object sender, EventArgs e)
        {
            var link = GetCurrentLink();

            link.Title = this.inputTitleLink.Value;
            link.URL = this.urlLink.Value;
            link.IsAnonymous = this.isAnonymous.Checked;

            data.Links.Update(link);
            data.SaveChanges();

            this.Response.Redirect("../../PrivateFun.aspx");
        }

        private Link GetCurrentLink()
        {
            var id = Guid.Parse(Request.QueryString["id"]);
            return data.Links.Find(id);
        }
    }
}