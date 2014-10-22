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
    public partial class JokeDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Guid id = Guid.Parse(Request.QueryString["jokeId"]);
            var data = FunBook.Data.FunBookData.Create();
            Joke joke = data.Jokes.Find(id);

            var view = new FunBook.Models.View();
            view.Liked = true;
            view.UserId = Context.User.Identity.GetUserId();
            joke.Views.Add(view);
            data.Jokes.Update(joke);
            data.Views.Add(view);
            data.SaveChanges();

            this.CurrentJoke = joke;

            if (joke.Comments.Count == 0)
            {
                this.jokeComments.InnerHtml = "";
            }
            else
            {
                this.RepeaterComments.DataSource = joke.Comments;
            }

            this.DataBind();
        }

        public Joke CurrentJoke { get; private set; }
    }
}