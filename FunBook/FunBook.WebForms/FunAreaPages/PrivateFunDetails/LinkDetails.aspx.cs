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
            this.CurrentLink = link;

            this.RepeaterComments.DataSource = link.Comments;
        }

        private Link GetCurrentLink()
        {
            var id = GetCurrentElementId();
            var link = data.Links.Find(id);
            if (!link.Views.Any(v => v.UserId == this.Context.User.Identity.GetUserId()))
            {
                var view = new FunBook.Models.View() { UserId = User.Identity.GetUserId() };
                link.Views.Add(view);
                data.Links.Update(link);
                data.Views.Add(view);
                data.SaveChanges();
            }

            return link;
        }

        private Guid GetCurrentElementId()
        {
            var linkId = Request.QueryString["linkId"];

            if (string.IsNullOrEmpty(linkId))
            {
                Response.Redirect("~/");
            }

            return Guid.Parse(linkId);
        }

        public Link CurrentLink { get; private set; }

        protected void Comment_Click(object sender, EventArgs e)
        {
            this.CurrentLink.Comments.Add(new Comment()
            {
                Text = this.CommentText.Value,
                UserId = User.Identity.GetUserId()
            });

            this.data.Links.Update(this.CurrentLink);
            this.data.SaveChanges();

            this.CommentText.Value = "";
        }

        protected void Like_Click(object sender, ImageClickEventArgs e)
        {
            var view = this.CurrentLink.Views.FirstOrDefault(v => v.UserId == User.Identity.GetUserId());
            view.Liked = true;
            this.data.Views.Update(view);
            this.data.SaveChanges();
        }

        protected void Hate_Click(object sender, ImageClickEventArgs e)
        {
            var view = this.CurrentLink.Views.FirstOrDefault(v => v.UserId == User.Identity.GetUserId());
            view.Liked = false;
            this.data.Views.Update(view);
            this.data.SaveChanges();
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            var view = this.CurrentLink.Views.FirstOrDefault(v => v.UserId == User.Identity.GetUserId());

            if (view.Liked.HasValue)
            {
                if (view.Liked.Value == true)
                {
                    this.BtnYesImage.ImageUrl = "~/Content/Images/yes2.png";
                    this.BtnNoImage.ImageUrl = "~/Content/Images/no.png";
                }
                else if (view.Liked.Value == false)
                {
                    this.BtnYesImage.ImageUrl = "~/Content/Images/yes.png";
                    this.BtnNoImage.ImageUrl = "~/Content/Images/no2.png";
                }
            }

            this.DataBind();
        }
    }
}