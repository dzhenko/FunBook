using FunBook.Data;
using FunBook.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace FunBook.WebForms.FunAreaPages.PrivateFunDetails
{
    public partial class ManageFun : System.Web.UI.Page
    {
        private static List<string> categoriesNames;
        private IFunBookData data;

        protected void Page_Init(object sender, EventArgs e)
        {
            this.data = new FunBookData();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            var data = FunBookData.Create();
            categoriesNames = data.Categories.All().Select(c => c.Name).ToList();
            
            if (!Page.IsPostBack)
            {
                this.DropDownListCategory.DataSource = categoriesNames;
                this.DataBind();

                this.PanelJoke.Visible = false;
                this.PanelPicture.Visible = false;
                this.PanelLink.Visible = false;
            }
        }

        protected void RadioButtonJoke_CheckedChanged(object sender, EventArgs e)
        {
            ShowSelectedDrinks();
        }

        protected void RadioButtonLink_CheckedChanged(object sender, EventArgs e)
        {
            ShowSelectedDrinks();
        }

        protected void RadioButtonPicture_CheckedChanged(object sender, EventArgs e)
        {
            ShowSelectedDrinks();
        }

        protected void jokeSubmit_Click(object sender, EventArgs e)
        {
            int categoryId = this.DropDownListCategory.SelectedIndex + 1;
            var category = data.Categories.Find(categoryId);

            var joke = new Joke
            {
                Title = this.inputTitleJoke.Value.ToString(),
                Text = this.jokeText.Value.ToString(),
                CategoryId = categoryId,
                Category = category,
                Created = DateTime.Now,
                UserId = Context.User.Identity.GetUserId(),
                IsAnonymous = this.isAnonymous.Checked
            };

            data.Jokes.Add(joke);
            data.Jokes.SaveChanges();

            this.Response.Redirect("../PrivateFun.aspx");
        }

        protected void linkSubmit_Click(object sender, EventArgs e)
        {
            int categoryId = this.DropDownListCategory.SelectedIndex + 1;
            var category = data.Categories.Find(categoryId);

            var link = new Link
            {
                Title = this.inputTitleLink.Value.ToString(),
                URL = this.urlLink.Value.ToString(),
                CategoryId = categoryId,
                Category = category,
                Created = DateTime.Now,
                UserId = Context.User.Identity.GetUserId(),
                IsAnonymous = this.isAnonymous.Checked
            };

            data.Links.Add(link);
            data.SaveChanges();

            this.Response.Redirect("../PrivateFun.aspx");
        }

        protected void pictureSubmit_Click(object sender, EventArgs e)
        {
            int categoryId = this.DropDownListCategory.SelectedIndex + 1;
            var category = data.Categories.Find(categoryId);

            var picture = new Picture
            {
                Title = this.inputTitlePicture.Value.ToString(),
                UrlPath = this.urlPic.Value.ToString(),
                CategoryId = categoryId,
                Category = category,
                Created = DateTime.Now,
                UserId = Context.User.Identity.GetUserId(),
                IsAnonymous = this.isAnonymous.Checked
            };

            data.Pictures.Add(picture);
            data.SaveChanges();

            this.Response.Redirect("../PrivateFun.aspx");
        }

        private void ShowSelectedDrinks()
        {
            if (this.RadioButtonJoke.Checked)
            {
                this.PanelJoke.Visible = true;
                this.PanelLink.Visible = false;
                this.PanelPicture.Visible = false;
            }

            if (this.RadioButtonLink.Checked)
            {
                this.PanelJoke.Visible = false;
                this.PanelLink.Visible = true;
                this.PanelPicture.Visible = false;
            }

            if (this.RadioButtonPicture.Checked)
            {
                this.PanelJoke.Visible = false;
                this.PanelLink.Visible = false;
                this.PanelPicture.Visible = true;
            }
        }

    }
}