using FunBook.Data;
using FunBook.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FunBook.WebForms.FunAreaPages.PrivateFunDetails.EditForms
{
    public partial class JokeEdit : System.Web.UI.Page
    {
        private IFunBookData data;

        protected void Page_Init(object sender, EventArgs e)
        {
            this.data = new FunBookData();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var joke = GetCurrentJoke();

                this.inputTitleJoke.Value = joke.Title;
                this.jokeText.Value = joke.Text;

                if (joke.IsAnonymous)
                {
                    this.isAnonymous.Checked = true;
                }

                this.DataBind();
            }
        }

        protected void jokeEdit_Click(object sender, EventArgs e)
        {
            var joke = GetCurrentJoke();

            joke.Title = this.inputTitleJoke.Value;
            joke.Text = this.jokeText.Value;
            joke.IsAnonymous = this.isAnonymous.Checked;

            data.Jokes.Update(joke);
            data.SaveChanges();

            this.Response.Redirect("../../PrivateFun.aspx");
        }

        private Joke GetCurrentJoke()
        {
            var id = Guid.Parse(Request.QueryString["id"]);
            return data.Jokes.Find(id);
        }
    }
}