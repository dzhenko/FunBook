using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using FunBook.Data;
using FunBook.WebForms.DataModels;

namespace FunBook.WebForms.FunAreaPages
{
    public partial class FunMasterPage : MasterPage
    {
        private FunBookData db = FunBookData.Create();

        protected void Page_Load(object sender, EventArgs e)
        {
            BindCategories();
            BindTags();
        }

        private void BindTags()
        {
            if(!this.db.Tags.All().Any())
            {
                return;
            }

            var tagList = this.db.Tags.All()
                .Where(t => t.Name.Length > 4)
                .OrderByDescending(a=> a.Jokes.Count() + a.Links.Count() + a.Pictures.Count())
                .Take(50)
                .Select(FunMasterTagItemDataModel.FromTag)
                .ToList();

            tagsCloud.DataSource = tagList;
            tagsCloud.DataBind();
        }

        private void BindCategories()
        {
            if (!this.db.Categories.All().Any())
            {
                return;
            }

            var catList = this.db.Categories.All()
                .Select(FunMasterCategoryItemDataModel.FromCategory)
                .ToList();

            categories.DataSource = catList;

            categories.DataBind();
        }

        protected void TbSearch_TextChanged(object sender, EventArgs e)
        {
            this.SearchHyperLink.NavigateUrl = "~/FunAreaPages/All.aspx?search=" + this.TbSearch.Text;
        }
    }
}