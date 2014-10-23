using System;
using System.Linq;
using System.Web.UI.WebControls;
using FunBook.Data;
using Microsoft.AspNet.Identity.EntityFramework;
using FunBook.Models;
using Microsoft.AspNet.Identity;
using FunBook.WebForms.DataModels;

namespace FunBook.WebForms.AdminAreaPages
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        private FunBookData data;

        public ManageUsers()
        {
            this.data = FunBookData.Create();
        }

        protected void ListView_Sorting(object sender, ListViewSortEventArgs e)
        {

        }

        public IQueryable<AdminUserDataModel> ListView_GetData()
        {
            string idStr = Request.QueryString["q"];

            if (idStr == null)
            {
                return this.data.Users.All().Select(AdminUserDataModel.FromUser);
            }
            else
            {
                return this.data.Users.All().Where(x => x.UserName.Contains(idStr)).Select(AdminUserDataModel.FromUser);
            }
        }
        
        // The id parameter name should match the DataKeyNames value set on the control
        public void ListView_UpdateItem(object id)
        {
            FunBook.Models.User item = null;

            item = this.data.Users.Find(id);
            if (item == null)
            {
                ModelState.AddModelError("", String.Format("Joke with id {0} was not found", id));
                return;
            }

            var userStore = new UserStore<User>(new FunBookDbContext());
            var userManager = new UserManager<User>(userStore);

            CheckBox checkbox = (CheckBox)this.ListView.FindControl("IsAdminCheckBox");
            TextBox textbox = (TextBox)this.ListView.FindControl("TextBoxSearch");
            var isChecked = checkbox.Checked;

            if (isChecked)
            {
                userManager.AddToRole(item.Id, "admin");
            }
            else
            {
                userManager.RemoveFromRole(item.Id, "admin");
            }

            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                this.data.SaveChanges();
            }
        }

        protected void LinkButtonSearch_Click(object sender, EventArgs e)
        {
            TextBox textbox = (TextBox)this.ListView.FindControl("TextBoxSearch");
            string query = string.Format("?q={0}", textbox.Text);
            Response.Redirect("~/AdminAreaPages/ManageUsers" + query);
        }

        public void ListView_DeleteItem(object id)
        {
            this.HiddenfieldDeleteId.Text = id.ToString();

            this.ModalWindow.Show();
        }

        protected void ModalWindow_OKButtonClicked(object sender, EventArgs e)
        {
            FunBook.Models.User item = null;

            var id = this.HiddenfieldDeleteId.Text;

            item = this.data.Users.Find(id);
            if (item == null)
            {
                ModelState.AddModelError("", String.Format("User with id {0} was not found", id));
                return;
            }

            this.data.Users.Delete(item);
            this.data.SaveChanges();

            DataBind();
        }
    }
}