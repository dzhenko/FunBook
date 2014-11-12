using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using FunBook.Data;
using Microsoft.AspNet.Identity;
using FunBook.Models;

namespace FunBook.WebForms.FunAreaPages
{
    public partial class Create : System.Web.UI.Page
    {
        private IFunBookData data;

        protected void Page_Init(object sender, EventArgs e)
        {
            this.data = new FunBookData();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Context.User.Identity.IsAuthenticated)
            {
                this.Response.Redirect("Home.aspx");
            }

            var data = FunBookData.Create();
            var id = Context.User.Identity.GetUserId();
            var jokes = data.Jokes.All().Where(uid => uid.UserId == id).OrderByDescending(i=>i.Created).ToList();
            var links = data.Links.All().Where(uid => uid.UserId == id).OrderByDescending(i => i.Created).ToList();
            var pics = data.Pictures.All().Where(uid => uid.UserId == id).OrderByDescending(i => i.Created).ToList();

            if (jokes.Count == 0)
            {
                this.liJoke.Attributes.Add("class", "disabled");
                this.liPic.InnerHtml = "<a>Pics</a>"; // I know it's not very pretty, but didn't found other way
            }

            if (links.Count == 0)
            {
                this.liLink.Attributes.Add("class", "disabled");
                this.liLink.InnerHtml = "<a>Links</a>";
            }

            if (pics.Count == 0)
            {
                this.liPic.Attributes.Add("class", "disabled");
                this.liPic.InnerHtml = "<a>Pics</a>";
            }

            this.ListViewJokes.DataSource = jokes;
            this.ListViewLinks.DataSource = links;
            this.ListViewPics.DataSource = pics;

            this.DataBind();
        }

        protected void LinkButtonJoke_Command(object sender, CommandEventArgs e)
        {
            var jokeId = e.CommandArgument;
            this.Response.Redirect("PrivateFunDetails/JokeDetails.aspx?jokeId=" + jokeId);
        }

        protected void LinkButtonLike_Command(object sender, CommandEventArgs e)
        {
            var likeId = e.CommandArgument;
            this.Response.Redirect("PrivateFunDetails/LinkDetails.aspx?linkId=" + likeId);
        }

        protected void LinkButtonPicture_Command(object sender, CommandEventArgs e)
        {
            var picId = e.CommandArgument;
            this.Response.Redirect("PrivateFunDetails/PictureDetails.aspx?picId=" + picId);
        }

        protected void LinkButtonEditJoke_Command(object sender, CommandEventArgs e)
        {
            var jokeId = e.CommandArgument;
            this.Response.Redirect("PrivateFunDetails/FunForms/JokeEdit.aspx?id=" + jokeId);
        }
        
        protected void LinkButtonEditLink_Command(object sender, CommandEventArgs e)
        {
            var linkId = e.CommandArgument;
            this.Response.Redirect("PrivateFunDetails/FunForms/LinkEdit.aspx?id=" + linkId);
        }
        

        protected void LinkButtonEditPicture_Command(object sender, CommandEventArgs e)
        {
            var id = Guid.Parse(e.CommandArgument.ToString());
            this.Response.Redirect("PrivateFunDetails/FunForms/PictureEdit.aspx?id=" + id);
        }


        private void LinkButtonDeleteLink_CommandReal(string stringId)
        {
            var id = Guid.Parse(stringId);
            var link = data.Links.Find(id);
            var views = link.Views.ToList();
            var comments = link.Comments.ToList();
            var tags = link.Tags.ToList();


            foreach (var view in views)
            {
                this.data.Views.Delete(view);
            }

            foreach (Comment com in comments)
            {
                this.data.Comments.Delete(com);
            }

            foreach (Tag tag in tags)
            {
                var tagJokes = tag.Links.ToList();

                foreach (var tagJoke in tagJokes)
                {
                    tag.Links.Remove(link);
                }
            }

            this.data.Links.Delete(link);

            this.data.SaveChanges();
            this.Response.Redirect("PrivateFun.aspx");
        }

        private void LinkButtonDeletePicture_CommandReal(string stringId)
        {
            var id = Guid.Parse(stringId);
            var picture = data.Pictures.Find(id);
            var views = picture.Views.ToList();
            var comments = picture.Comments.ToList();
            var tags = picture.Tags.ToList();


            foreach (var view in views)
            {
                this.data.Views.Delete(view);
            }

            foreach (Comment com in comments)
            {
                this.data.Comments.Delete(com);
            }

            foreach (Tag tag in tags)
            {
                var tagJokes = tag.Pictures.ToList();

                foreach (var tagJoke in tagJokes)
                {
                    tag.Pictures.Remove(picture);
                }
            }

            this.data.Pictures.Delete(picture);

            this.data.SaveChanges();
            this.Response.Redirect("PrivateFun.aspx");
        }

        private void LinkButtonDeleteJoke_CommandReal(string stringId)
        {
            var id = Guid.Parse(stringId);
            var joke = data.Jokes.Find(id);
            var views = joke.Views.ToList();
            var comments = joke.Comments.ToList();
            var tags = joke.Tags.ToList();


            foreach (var view in views)
            {
                this.data.Views.Delete(view);
            }

            foreach (Comment com in comments)
            {
                this.data.Comments.Delete(com);
            }

            foreach (Tag tag in tags)
            {
                var tagJokes = tag.Jokes.ToList();

                foreach (var tagJoke in tagJokes)
                {
                    tag.Jokes.Remove(joke);
                }
            }

            this.data.Jokes.Delete(joke);

            this.data.SaveChanges();
            this.Response.Redirect("PrivateFun.aspx");
        }

        protected void LinkButtonDeleteJoke_Command(object sender, CommandEventArgs e)
        {
            this.HiddenfieldDeleteId.Text = e.CommandArgument.ToString();
            this.HiddenfieldDeleteType.Text = "Joke";
            this.ModalWindow.Show();
        }

        protected void LinkButtonDeleteLink_Command(object sender, CommandEventArgs e)
        {
            this.HiddenfieldDeleteId.Text = e.CommandArgument.ToString();
            this.HiddenfieldDeleteType.Text = "Link";
            this.ModalWindow.Show();
        }
        
        protected void LinkButtonDeletePicture_Command(object sender, CommandEventArgs e)
        {
            this.HiddenfieldDeleteId.Text = e.CommandArgument.ToString();
            this.HiddenfieldDeleteType.Text = "Picture";
            this.ModalWindow.Show();
        }

        protected void ModalWindow_OKButtonClicked(object sender, EventArgs e)
        {
            var id =  this.HiddenfieldDeleteId.Text;
            if (string.IsNullOrEmpty(id))
	        {
		         return;
	        }

            switch (this.HiddenfieldDeleteType.Text)
            {
                case "Joke": this.LinkButtonDeleteJoke_CommandReal(id); return;
                case "Link": this.LinkButtonDeleteLink_CommandReal(id); return;
                case "Picture": this.LinkButtonDeletePicture_CommandReal(id); return;
                default: return;
            }
        }
    }
}