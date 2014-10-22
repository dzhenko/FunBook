using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

using FunBook.Data;
using FunBook.WebForms.DataModels;

namespace FunBook.WebForms.FunAreaPages
{
    public partial class Home : Page
    {
        private FunBookData db = FunBookData.Create();

        public void BindRecentItems()
        {
            var mostRecentJoke = this.db.Jokes.All()
                .OrderByDescending(j => j.Created)
                .Take(1)
                .Select(HomeItemDataModel.FromJoke)
                .FirstOrDefault();
            var mostRecentLink = this.db.Links.All()
                .OrderByDescending(l => l.Created)
                .Take(1)
                .Select(HomeItemDataModel.FromLink)
                .FirstOrDefault();
            var mostRecentPicture = this.db.Pictures.All()
                .OrderByDescending(j => j.Created)
                .Take(1)
                .Select(HomeItemDataModel.FromPicture)
                .FirstOrDefault();

            this.recentItemsGrid.DataSource = new List<HomeItemDataModel>() { mostRecentJoke, mostRecentLink, mostRecentPicture };

            this.recentItemsGrid.DataBind();
        }

        public void BindPopularItems()
        {
            var mostPopularJoke = this.db.Jokes.All()
                .OrderByDescending(j => j.Views.Count)
                .Take(1)
                .Select(HomeItemDataModel.FromJoke)
                .FirstOrDefault();
            var mostPopularLink = this.db.Links.All()
                .OrderByDescending(l => l.Views.Count)
                .Take(1)
                .Select(HomeItemDataModel.FromLink)
                .FirstOrDefault();
            var mostPopularPicture = this.db.Pictures.All()
                .OrderByDescending(j => j.Views.Count)
                .Take(1)
                .Select(HomeItemDataModel.FromPicture)
                .FirstOrDefault();

            this.popularItemsGrid.DataSource = new List<HomeItemDataModel>() { mostPopularJoke, mostPopularLink, mostPopularPicture };
            this.popularItemsGrid.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.BindRecentItems();
            this.BindPopularItems();
        }
    }
}