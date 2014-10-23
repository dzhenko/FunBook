using FunBook.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FunBook.WebForms.AdminAreaPages
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        FunBookData data;

        public ManageUsers()
        {
            this.data = FunBookData.Create();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ListView_Sorting(object sender, ListViewSortEventArgs e)
        {

        }

        public IQueryable<FunBook.Models.User> ListView_GetData()
        {
            string idStr = Request.QueryString["q"];
            if (idStr == null)
            {
                return this.data.Users.All();
            }
            else
            {
                return this.data.Users.All().Where(x => x.UserName.Contains(idStr));
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

            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                this.data.SaveChanges();
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListView_DeleteItem(object id)
        {
            FunBook.Models.User item = null;

            item = this.data.Users.Find(id);
            if (item == null)
            {
                ModelState.AddModelError("", String.Format("Joke with id {0} was not found", id));
                return;
            }

            this.data.Users.Delete(item);
            this.data.SaveChanges();
        }

        protected void LinkButtonSearch_Click(object sender, EventArgs e)
        {
            TextBox textbox = (TextBox)this.ListView.FindControl("TextBoxSearch");
            string query = string.Format("?q={0}", textbox.Text);
            Response.Redirect("~/AdminAreaPages/ManageUsers" + query);
        }
    }
}