using FunBook.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FunBook.WebForms.AdminAreaPages
{
    public partial class ManageItems : System.Web.UI.Page
    {
        FunBookData data;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.data = FunBookData.Create();
        }

        protected void ListView1_Sorting(object sender, ListViewSortEventArgs e)
        {

        }

        public IQueryable<FunBook.Models.Joke> ListView1_GetData()
        {
            return this.data.Jokes.All();
        }

        public void ListView1_UpdateItem(object id)
        {
            FunBook.Models.Joke item = null;

            item = this.data.Jokes.Find(id);
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

        public void ListView1_DeleteItem(object id)
        {
            FunBook.Models.Joke item = null;

            item = this.data.Jokes.Find(id);
            if (item == null)
            {
                ModelState.AddModelError("", String.Format("Joke with id {0} was not found", id));
                return;
            }

            this.data.Jokes.Delete(item);
            this.data.SaveChanges();
        }
    }
}