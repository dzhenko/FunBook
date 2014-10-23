using FunBook.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using FunBook.Data;

namespace FunBook.WebForms.FunAreaPages.PrivateFunDetails
{
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

            var view = new FunBook.Models.View();
            view.Liked = true;
            view.UserId = Context.User.Identity.GetUserId();
            joke.Views.Add(view);
            data.Jokes.Update(joke);
            data.Views.Add(view);
            data.SaveChanges();

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

        protected void LinkButtonEditJoke_Command(object sender, EventArgs e)
        {
            var jokeId = GetCurrentElementId();
            this.Response.Redirect("FunForms/JokeEdit.aspx?id=" + jokeId);
        }

        protected void LinkButtonDeleteJoke_Command(object sender, EventArgs e)
        {
            this.data.Jokes.Delete(GetCurrentJoke());
            this.data.SaveChanges();
            this.Response.Redirect("../PrivateFun.aspx");
        }

        private Joke GetCurrentJoke()
        {
            var id = GetCurrentElementId();
            return data.Jokes.Find(id);
        }

        private Guid GetCurrentElementId()
        {
            return Guid.Parse(Request.QueryString["jokeId"]);
        }

        public Joke CurrentJoke { get; private set; }
    }
}