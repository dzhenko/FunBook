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
        private IFunBookData data;

        protected void Page_Init(object sender, EventArgs e)
        {
            this.data = new FunBookData();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            var link = GetCurrentLink();

            var view = new FunBook.Models.View();
            view.Liked = true;
            view.UserId = Context.User.Identity.GetUserId();
            link.Views.Add(view);
            data.Links.Update(link);
            data.Views.Add(view);
            data.SaveChanges();

            this.CurrentLink = link;
        }

        protected void LinkButtonEditLink_Command(object sender, EventArgs e)
        {
            // TODO:
        }

        protected void LinkButtonDeleteLink_Command(object sender, EventArgs e)
        {
            this.data.Links.Delete(GetCurrentLink());
            this.data.SaveChanges();
            this.Response.Redirect("../PrivateFun.aspx");
        }

        private Link GetCurrentLink()
        {
            var id = Guid.Parse(Request.QueryString["linkId"]);
            return data.Links.Find(id);
        }

        public Link CurrentLink { get; private set; }
    }
}