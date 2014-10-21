using FunBook.Data;
using FunBook.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FunBook.WebForms
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var data = FunBookData.Create();
            data.Jokes.Add(new Joke() 
            { 
                CategoryId = 1, 
                Text = "First Joke Ever", 
                UserId="aaa100b9-0d30-4d15-bad3-71325e33646f",
                Title = "First Joke",
                IsAnonymous = false,

            });
            data.SaveChanges();
        }
    }
}