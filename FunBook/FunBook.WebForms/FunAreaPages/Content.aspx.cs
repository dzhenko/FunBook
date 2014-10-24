using System;
using System.Linq;
using System.Web.ModelBinding;
using System.Web.UI;
using FunBook.Data;
using FunBook.Models;
using FunBook.WebForms.DataModels;

namespace FunBook.WebForms.FunAreaPages
{
    public partial class Content : Page
    {
        private FunBookData db = FunBookData.Create();

        public IQueryable<HomeItemDataModel> JokesView_GetData([QueryString] string type, [QueryString] int? id)
        {
            int jokeId = 1;
            if (id.HasValue)
            {
                jokeId = id.Value;
            }

            IQueryable<HomeItemDataModel> result;

            if (type == "category")
            {
                result = this.db.Jokes.All().Where(j => j.CategoryId == jokeId).Select(HomeItemDataModel.FromJoke);
            }
            else
            {
                result = this.db.Jokes.All().Where(j => j.Tags.Any(t => t.Id == jokeId)).Select(HomeItemDataModel.FromJoke);
                // result = this.db.Tags.Find(id).Jokes.AsQueryable<Joke>();
            }

            return result;
        }

        public IQueryable<HomeItemDataModel> LinksView_GetData([QueryString] string type, [QueryString] int? id)
        {
            int linkId = 1;
            if (id.HasValue)
            {
                linkId = id.Value;
            }
            IQueryable<HomeItemDataModel> result;
            if (type == "category")
            {
                result = this.db.Links.All().Where(l => l.CategoryId == linkId).Select(HomeItemDataModel.FromLink);
            }
            else
            {
                result = this.db.Links.All().Where(l => l.Tags.Any(t => t.Id == linkId)).Select(HomeItemDataModel.FromLink);
                // result = this.db.Tags.Find(id).Links.AsQueryable<Link>();
            }

            return result;
        }

        public IQueryable<HomeItemDataModel> PicturesView_GetData([QueryString] string type, [QueryString] int? id)
        {
            int picId = 1;
            if (id.HasValue)
            {
                picId = id.Value;
            }
            IQueryable<HomeItemDataModel> result;
            if (type == "category")
            {
                result = this.db.Pictures.All().Where(p => p.CategoryId == picId).Select(HomeItemDataModel.FromPicture);
            }
            else
            {
                result = this.db.Pictures.All().Where(p => p.Tags.Any(t => t.Id == picId)).Select(HomeItemDataModel.FromPicture);
                // result = this.db.Tags.Find(id).Pictures.AsQueryable<Picture>();
            }

            return result;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}