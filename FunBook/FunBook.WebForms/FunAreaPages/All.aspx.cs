using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using FunBook.Data;
using FunBook.WebForms.DataModels;

using System.Web.ModelBinding;


namespace FunBook.WebForms.FunAreaPages
{
    public partial class All : Page
    {
        private FunBookData db = FunBookData.Create();

        public IQueryable<HomeItemDataModel> GridViewAll_GetData([QueryString] string search)
        {
            if (search == null)
            {
                search = string.Empty;
            }

            var allJoke = this.db.Jokes.All()
                .Where(j => j.Text.Contains(search) || j.Title.Contains(search))
                .Select(HomeItemDataModel.FromJoke);

            var allLink = this.db.Links.All()
                .Where(l => l.URL.Contains(search) || l.Title.Contains(search))
                .Select(HomeItemDataModel.FromLink);

            var allPicture = this.db.Pictures.All()
                .Where(p => p.UrlPath.Contains(search) || p.Title.Contains(search))
                .Select(HomeItemDataModel.FromPicture);

            return allJoke.Union(allLink).Union(allPicture);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}