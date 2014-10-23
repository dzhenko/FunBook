using System;
using System.Linq;
using System.Web.ModelBinding;
using System.Web.UI;
using FunBook.Data;
using FunBook.WebForms.DataModels;

namespace FunBook.WebForms.FunAreaPages
{
    public partial class All : Page
    {
        private FunBookData db = FunBookData.Create();

        public IQueryable<AllItemDataModel> GridViewAll_GetData([QueryString] string search)
        {
            if (search == null)
            {
                search = string.Empty;
            }

            search = search.ToLower();

            var allJoke = this.db.Jokes.All()
                              .Where(j => j.Text.ToLower().Contains(search) || j.Title.ToLower().Contains(search))
                              .Select(AllItemDataModel.FromJoke);

            var allLink = this.db.Links.All()
                              .Where(l => l.URL.ToLower().Contains(search) || l.Title.ToLower().Contains(search))
                              .Select(AllItemDataModel.FromLink);

            var allPicture = this.db.Pictures.All()
                                 .Where(p => p.UrlPath.ToLower().Contains(search) || p.Title.ToLower().Contains(search))
                                 .Select(AllItemDataModel.FromPicture);

            return allJoke.Union(allLink).Union(allPicture);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.HoverDetails.ItemsToShow = this.GridViewAll_GetData(null);
        }
    }
}