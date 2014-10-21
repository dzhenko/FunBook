using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using FunBook.Data;
using Microsoft.AspNet.Identity;

namespace FunBook.WebForms.FunAreaPages
{
    public partial class Create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var data = FunBookData.Create();
            var id = Context.User.Identity.GetUserId();
            var jokes = data.Jokes.All().Where(uid => uid.UserId == id).ToList();
            var links = data.Links.All().Where(uid => uid.UserId == id).ToList();
            var pics = data.Pictures.All().Where(uid => uid.UserId == id).ToList();

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
            this.Response.Redirect("PrivateFuns/JokeDetails.aspx?jokeId=" + jokeId);
        }
    }
}