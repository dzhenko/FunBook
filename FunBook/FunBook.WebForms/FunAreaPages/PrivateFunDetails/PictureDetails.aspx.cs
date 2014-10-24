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
            this.CurrentPicture = pic;

            this.RepeaterComments.DataSource = pic.Comments;
        }

        private Picture GetCurrentPicture()
        {
            var id = GetCurrentElementId();
            var pic = data.Pictures.Find(id);
            if (!pic.Views.Any(v => v.UserId == this.Context.User.Identity.GetUserId()))
            {
                var view = new FunBook.Models.View() { UserId = User.Identity.GetUserId() };
                pic.Views.Add(view);
                data.Pictures.Update(pic);
                data.Views.Add(view);
                data.SaveChanges();
            }

            return pic;
        }

        private Guid GetCurrentElementId()
        {
            var picId = Request.QueryString["picId"];

            if (string.IsNullOrEmpty(picId))
            {
                Response.Redirect("~/");
            }

            return Guid.Parse(picId);
        }

        public Picture CurrentPicture { get; private set; }

        protected void Comment_Click(object sender, EventArgs e)
        {
            this.CurrentPicture.Comments.Add(new Comment()
            {
                Text = this.CommentText.Value,
                UserId = User.Identity.GetUserId()
            });

            this.data.Pictures.Update(this.CurrentPicture);
            this.data.SaveChanges();

            this.CommentText.Value = "";
        }

        protected void Like_Click(object sender, ImageClickEventArgs e)
        {
            var view = this.CurrentPicture.Views.FirstOrDefault(v => v.UserId == User.Identity.GetUserId());
            view.Liked = true;
            this.data.Views.Update(view);
            this.data.SaveChanges();
        }

        protected void Hate_Click(object sender, ImageClickEventArgs e)
        {
            var view = this.CurrentPicture.Views.FirstOrDefault(v => v.UserId == User.Identity.GetUserId());
            view.Liked = false;
            this.data.Views.Update(view);
            this.data.SaveChanges();
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            var view = this.CurrentPicture.Views.FirstOrDefault(v => v.UserId == User.Identity.GetUserId());

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