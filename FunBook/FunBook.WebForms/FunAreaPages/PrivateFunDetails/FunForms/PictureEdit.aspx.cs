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
    public partial class PictureEdit : System.Web.UI.Page
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
                var picture = GetCurrentLink();

                this.inputTitlePicture.Value = picture.Title;
                this.urlPic.Value = picture.UrlPath;

                if (picture.IsAnonymous)
                {
                    this.isAnonymous.Checked = true;
                }

                this.DataBind();
            }
        }

        protected void pictureEdit_Click(object sender, EventArgs e)
        {
            var picture = GetCurrentLink();

            picture.Title = this.inputTitlePicture.Value;
            picture.UrlPath = this.urlPic.Value;
            picture.IsAnonymous = this.isAnonymous.Checked;

            data.Pictures.Update(picture);
            data.SaveChanges();

            this.Response.Redirect("../../PrivateFun.aspx");
        }

        private Picture GetCurrentLink()
        {
            var id = Guid.Parse(Request.QueryString["id"]);
            return data.Pictures.Find(id);
        }
    }
}