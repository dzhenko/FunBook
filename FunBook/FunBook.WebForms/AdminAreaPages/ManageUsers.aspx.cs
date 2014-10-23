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
            //if (this.User == null || !this.User.Identity.IsAuthenticated || !Roles.IsUserInRole("admin"))
            //{
            //    Server.Transfer("~/FunAreaPages/Home.aspx", true);
            //}
        }

        protected void ListView1_Sorting(object sender, ListViewSortEventArgs e)
        {

        }

        public IQueryable<FunBook.Models.User> ListView1_GetData()
        {
            return this.data.Users.All();
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListView1_UpdateItem(object id)
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
        public void ListView1_DeleteItem(object id)
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
    }
}