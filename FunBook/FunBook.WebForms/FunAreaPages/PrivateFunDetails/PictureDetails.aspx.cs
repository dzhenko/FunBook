using FunBook.Data;
using FunBook.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace FunBook.WebForms.FunAreaPages.PrivateFunDetails
{
    public partial class PictureDetails : System.Web.UI.Page
    {
        private IFunBookData data;

        protected void Page_Init(object sender, EventArgs e)
        {
            this.data = new FunBookData();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            var pic = GetCurrentPicture();

            var view = new FunBook.Models.View();
            view.Liked = true;
            view.UserId = Context.User.Identity.GetUserId();
            pic.Views.Add(view);
            data.Pictures.Update(pic);
            data.Views.Add(view);
            data.SaveChanges();

            this.CurrentPicture = pic;
        }

        protected void LinkButtonEditPicture_Command(object sender, EventArgs e)
        {
            var id = GetCurrentElementId();
            this.Response.Redirect("FunForms/PictureEdit.aspx?id=" + id);
        }

        protected void LinkButtonDeletePicture_Command(object sender, EventArgs e)
        {
            this.data.Pictures.Delete(GetCurrentPicture());
            this.data.SaveChanges();
            this.Response.Redirect("../PrivateFun.aspx");
        }

        private Picture GetCurrentPicture()
        {
            var id = GetCurrentElementId();
            return data.Pictures.Find(id);
        }

        private Guid GetCurrentElementId()
        {
            return Guid.Parse(Request.QueryString["picId"]);
        }

        public Picture CurrentPicture { get; private set; }
    }
}