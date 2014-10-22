﻿using FunBook.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FunBook.WebForms.FunAreaPages.PrivateFunDetails
{
    public partial class JokeDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Guid id = Guid.Parse(Request.QueryString["jokeId"]);
            var data = FunBook.Data.FunBookData.Create();
            Joke joke = data.Jokes.Find(id);

            this.CurrentJoke = joke;
            this.RepeaterTags.DataSource = joke.Tags;
            this.RepeaterComments.DataSource = joke.Comments;
            this.DataBind();
        }

        public Joke CurrentJoke { get; set; }
    }
}