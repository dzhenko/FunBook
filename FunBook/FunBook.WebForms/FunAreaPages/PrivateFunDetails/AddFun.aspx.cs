using FunBook.Data;
using FunBook.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using FunBook.ImageUpload;
using System.IO;

namespace FunBook.WebForms.FunAreaPages.PrivateFunDetails
{
    public partial class AddFun : System.Web.UI.Page
    {
        private static List<string> categoriesNames;
        private IFunBookData data;

        protected void Page_Init(object sender, EventArgs e)
        {
            this.data = new FunBookData();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Form.Enctype = "multipart/form-data";
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
            this.PanelJoke.Visible = true;
            this.PanelLink.Visible = false;
            this.PanelPicture.Visible = false;
        }

        protected void RadioButtonLink_CheckedChanged(object sender, EventArgs e)
        {
            this.PanelJoke.Visible = false;
            this.PanelLink.Visible = true;
            this.PanelPicture.Visible = false;
        }

        protected void RadioButtonPicture_CheckedChanged(object sender, EventArgs e)
        {
            this.PanelJoke.Visible = false;
            this.PanelLink.Visible = false;
            this.PanelPicture.Visible = true;
        }

        protected void JokeSubmit_Click(object sender, EventArgs e)
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

            if (FileUploadControl.HasFile)
            {
                // TODO:
            }

            this.Response.Redirect("../PrivateFun.aspx");
        }

        protected void LinkSubmit_Click(object sender, EventArgs e)
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
                IsAnonymous = this.isAnonymousLink.Checked
            };

            data.Links.Add(link);
            data.SaveChanges();

            this.Response.Redirect("../PrivateFun.aspx");
        }

        protected void PictureSubmit_Click(object sender, EventArgs e)
        {
            var file = this.FileUploadControl.PostedFile;
            if (file == null)
	        {
                // no file
		        return;
            }

            if (!file.FileName.EndsWith(".jpg") || file.ContentType != "image/jpeg")
            {
                // invalid file format
                return;
            }

            if (file.ContentLength > 1024 * 1024 * 10)
            {
                // invalid file size
                return;
            }

            int categoryId = this.DropDownListCategory.SelectedIndex + 1;
            var category = data.Categories.Find(categoryId);

            var fileBytes = (new BinaryReader(file.InputStream)).ReadBytes(file.ContentLength);
            var base64 = Convert.ToBase64String(fileBytes);
            var uploader = new TelerikBackendServicesImageUpload();
            var urlPath = uploader.UrlFromBase64Image(base64, category.Name, new string[] {Title});

            var picture = new Picture
            {
                Title = this.inputTitlePicture.Value.ToString(),
                UrlPath = urlPath,
                CategoryId = categoryId,
                Category = category,
                Created = DateTime.Now,
                UserId = Context.User.Identity.GetUserId(),
                IsAnonymous = this.isAnonymousPic.Checked
            };

            data.Pictures.Add(picture);
            data.SaveChanges();

            this.Response.Redirect("../PrivateFun.aspx");
        }
    }
}