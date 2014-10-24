namespace FunBook.WebForms.FunAreaPages.PrivateFunDetails
{
    using System;
    using System.Linq;
    using System.Web.UI;

    using Microsoft.AspNet.Identity;

    using FunBook.Data;
    using FunBook.Models;

    public partial class JokeDetails : System.Web.UI.Page
    {
        private IFunBookData data;

        protected void Page_Init(object sender, EventArgs e)
        {
            this.data = new FunBookData();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            var joke = GetCurrentJoke();
            this.CurrentJoke = joke;

            this.RepeaterComments.DataSource = joke.Comments;
        }

        private Joke GetCurrentJoke()
        {
            var id = GetCurrentElementId();
            var joke = data.Jokes.Find(id);
            if (!joke.Views.Any(v => v.UserId == this.Context.User.Identity.GetUserId()))
            {
                var view = new FunBook.Models.View() { UserId = User.Identity.GetUserId() };
                joke.Views.Add(view);
                data.Jokes.Update(joke);
                data.Views.Add(view);
                data.SaveChanges();
            }

            return joke;
        }

        private Guid GetCurrentElementId()
        {
            var jokeId = Request.QueryString["jokeId"];

            if (string.IsNullOrEmpty(jokeId))
            {
                Response.Redirect("~/");
            }

            return Guid.Parse(jokeId);
        }

        public Joke CurrentJoke { get; private set; }

        protected void Comment_Click(object sender, EventArgs e)
        {
            this.CurrentJoke.Comments.Add(new Comment()
            {
                Text = this.CommentText.Value,
                UserId = User.Identity.GetUserId()
            });

            this.data.Jokes.Update(this.CurrentJoke);
            this.data.SaveChanges();

            this.CommentText.Value = "";
        }

        protected void Like_Click(object sender, ImageClickEventArgs e)
        {
            var view = this.CurrentJoke.Views.FirstOrDefault(v => v.UserId == User.Identity.GetUserId());
            view.Liked = true;
            this.data.Views.Update(view);
            this.data.SaveChanges();
        }

        protected void Hate_Click(object sender, ImageClickEventArgs e)
        {
            var view = this.CurrentJoke.Views.FirstOrDefault(v => v.UserId == User.Identity.GetUserId());
            view.Liked = false;
            this.data.Views.Update(view);
            this.data.SaveChanges();
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            var view = this.CurrentJoke.Views.FirstOrDefault(v => v.UserId == User.Identity.GetUserId());

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