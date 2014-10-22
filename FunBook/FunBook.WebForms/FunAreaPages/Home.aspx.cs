using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

using FunBook.Data;

namespace FunBook.WebForms.FunAreaPages
{
    public partial class Home : Page
    {
        private FunBookData db = FunBookData.Create();

        public void BindRecentItems()
        {
            var mostRecentJoke = this.db.Jokes.All().OrderByDescending(j => j.Created).FirstOrDefault();
           // var mostRecentLink = this.db.Links.All().OrderByDescending(j => j.Created).FirstOrDefault();
          //  var mostRecentPicture = this.db.Pictures.All().OrderByDescending(j => j.Created).FirstOrDefault();

           // List<object> recentItems = this.AppendItems(mostRecentJoke, mostRecentLink, mostRecentPicture);
             List<object> recentItems = this.AppendItems(mostRecentJoke);

            this.recentItemsGrid.DataSource = recentItems.ToList();
            this.recentItemsGrid.DataBind();
        }

        public void BindPopularItems()
        {
            var mostPopularJoke = this.db.Jokes.All().OrderByDescending(j => j.Views.Count).FirstOrDefault();
           // var mostPopularLink =  this.db.Links.All().OrderByDescending(j => j.Views.Count).FirstOrDefault();
           // var mostPopularPicture = this.db.Pictures.All().OrderByDescending(j => j.Views.Count).FirstOrDefault();

           // List<object> popularItems = this.AppendItems(mostPopularJoke, mostPopularLink, mostPopularPicture);
             List<object> popularItems = this.AppendItems(mostPopularJoke);

            this.popularItemsGrid.DataSource = popularItems.ToList();
            this.popularItemsGrid.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.BindRecentItems();
            this.BindPopularItems();
        }

        private List<object> AppendItems(params object[] items)
        {
            List<object> recentItems = new List<object>();
            foreach (var item in items)
            {
                if (item != null)
                {
                    recentItems.Add(item);
                }
            }

            return recentItems;
        }
    }
}