using FunBook.Data;
using FunBook.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FunBook.WebForms.FunAreaPages
{
    public partial class Home : System.Web.UI.Page
    {
        FunBookData db = FunBookData.Create();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IEnumerable<Joke> RecentItems_GetData()
        {
            if (!db.Jokes.All().Any())
            {
                return new List<Joke>();
            }

            List<Joke> recentItems = new List<Joke>();

            var mostRecentJoke = db.Jokes.All().OrderBy(j => j.Id).Take(1).ToList();

            recentItems.Add(mostRecentJoke[0]);
            return recentItems;
        }
    }
}