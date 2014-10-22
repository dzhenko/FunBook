using FunBook.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using FunBook.Models;

namespace FunBook.WebForms.FunAreaPages.PrivateFunDetails
{
    public partial class LikeDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Guid id = Guid.Parse(Request.QueryString["linkId"]);
            var data = FunBookData.Create();
            var link = data.Links.Find(id);

            var view = new FunBook.Models.View();
            view.Liked = true;
            view.UserId = Context.User.Identity.GetUserId();
            link.Views.Add(view);
            data.Links.Update(link);
            data.Views.Add(view);
            data.SaveChanges();

            this.CurrentLink = link;
        }

        public Link CurrentLink { get; private set; }
    }
}