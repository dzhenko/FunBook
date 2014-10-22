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
        protected void Page_Load(object sender, EventArgs e)
        {
            Guid id = Guid.Parse(Request.QueryString["picId"]);
            var data = FunBookData.Create();
            var pic = data.Pictures.Find(id);

            var view = new FunBook.Models.View();
            view.Liked = true;
            view.UserId = Context.User.Identity.GetUserId();
            pic.Views.Add(view);
            data.Pictures.Update(pic);
            data.Views.Add(view);
            data.SaveChanges();

            this.CurrentPicture = pic;
        }

        public Picture CurrentPicture { get; private set; }
    }
}