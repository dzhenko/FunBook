using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using FunBook.Data;

namespace FunBook.WebForms.FunAreaPages
{
    public partial class FunMasterPage : MasterPage
    {
        FunBookData db = FunBookData.Create();

        protected void Page_Load(object sender, EventArgs e)
        {
            BindCategories();
            BindTags();
        }

        private void BindTags()
        {
            var tagList = db.Tags.All().Select(t => new
            {
                Name = t.Name,
                Count = t.Jokes.Count() + t.Links.Count() + t.Pictures.Count(),
                Id = t.Id
            });

            tagsCloud.DataSource = tagList.ToList();

            tagsCloud.DataBind();
        }

        private void BindCategories()
        {
            var catList = db.Categories.All().Select(c => new
            {
                Name = c.Name,
                Count = c.Jokes.Count() + c.Links.Count() + c.Pictures.Count(),
                Id = c.Id
            });

            categories.DataSource = catList.ToList();

            categories.DataBind();
        }
    }
}