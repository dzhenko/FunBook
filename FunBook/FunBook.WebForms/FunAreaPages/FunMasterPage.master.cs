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

        private int minFontSize = 0;
        private int maxFontSize = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            BindCategories();
            BindTags();
        }

        private void BindTags()
        {
            if(!db.Tags.All().Any())
            {
                return;
            }

            var tagList = db.Tags.All()
                .Where(t => t.Name.Length > 4)
                .OrderByDescending(a=> a.Jokes.Count() + a.Links.Count() + a.Pictures.Count())
                .Take(50)
                .Select(t => new
                {
                    Name = t.Name,
                    Count = t.Jokes.Count() + t.Links.Count() + t.Pictures.Count(),
                    Id = t.Id
                }).ToList();

            tagsCloud.DataSource = tagList;

            this.minFontSize = tagList[tagList.Count - 1].Count;
            this.maxFontSize = tagList[0].Count;

            tagsCloud.DataBind();
        }

        private void BindCategories()
        {
            if (!db.Categories.All().Any())
            {
                return;
            }
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