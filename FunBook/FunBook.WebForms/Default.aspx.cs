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
            var data = new FunBookData();
            data.Jokes.Add(new Joke() { CategoryId = 1, IsAnonymous = false, Text = "First joke ever lol", Title = "Sample", UserId = "49a34eb2-35b3-436a-9ab4-7fbaa114f15e" });
            data.SaveChanges();
        }
    }
}