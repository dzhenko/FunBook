using System;
using System.Linq;
using System.Web.ModelBinding;
using System.Web.UI;
using FunBook.Data;
using FunBook.Models;

namespace FunBook.WebForms.FunAreaPages
{
    public partial class Content : Page
    {
        private FunBookData db = FunBookData.Create();

        public IQueryable<Joke> JokesView_GetData([QueryString] string type, [QueryString] int? id)
        {
            if (id==null)
            {
                id = 1;
            }
            IQueryable<Joke> result;
            if (type == "category")
            {
                result = this.db.Jokes.All().Where(j => j.CategoryId == id);
            }
            else
            {
                result = this.db.Tags.Find(id).Jokes.AsQueryable<Joke>();
            }

            return result;
        }

        public IQueryable<Link> LinksView_GetData([QueryString] string type, [QueryString] int? id)
        {
            if (id == null)
            {
                id = 1;
            }
            IQueryable<Link> result;
            if (type == "category")
            {
                result = this.db.Links.All().Where(l => l.CategoryId == id);
            }
            else
            {
                result = this.db.Tags.Find(id).Links.AsQueryable<Link>();
            }

            return result;
        }

        public IQueryable<Picture> PicturesView_GetData([QueryString] string type, [QueryString] int? id)
        {
            if (id == null)
            {
                id = 1;
            }
            IQueryable<Picture> result;
            if (type == "category")
            {
                result = this.db.Pictures.All().Where(l => l.CategoryId == id);
            }
            else
            {
                result = this.db.Tags.Find(id).Pictures.AsQueryable<Picture>();
            }

            return result;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}