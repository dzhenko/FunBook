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

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            //if (e.CommandName == "Insert")
            //{
            //    TextBox itemText = (TextBox)e.Item.FindControl("Text");
            //    TextBox itemTitle = (TextBox)e.Item.FindControl("Title");
            //    string insertCommand = "Insert into [Jokes] ([Text],[Title]) Values('" + itemText.Text + "', '" + itemTitle.Text + "');";
            //    SqlDataSourceItems.InsertCommand = insertCommand;
            //}
            //else if (e.CommandName == "Update")
            //{
            //    TextBox itemText = (TextBox)e.Item.FindControl("Text");
            //    TextBox itemTitle = (TextBox)e.Item.FindControl("Title");
            //    TextBox itemId = (TextBox)e.Item.FindControl("Id");
            //    string updateCommand = "Update [Jokes] set [Text]='" + itemText.Text + "', [Title]='" + itemTitle.Text + "' where Id=" + itemId.Text + ";";
            //     SqlDataSourceItems.UpdateCommand = updateCommand;
            //}
            //else if (e.CommandName == "Delete")
            //{
            //    TextBox itemId = (TextBox)e.Item.FindControl("Id");
            //    string deleteCommand = "delete from [Contacts] where Id=" + itemId.Text;
            //    SqlDataSourceItems.DeleteCommand = deleteCommand;
            //}
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<FunBook.Models.Joke> ListView1_GetData()
        {
            return this.data.Jokes.All();
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListView1_UpdateItem(object id)
        {
            FunBook.Models.Joke item = null;
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here, e.g. MyDataLayer.SaveChanges();

            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListView1_DeleteItem(object id)
        {
            var item = this.data.Jokes.Find(id);
            this.data.Jokes.Delete(item);
            this.data.SaveChanges();
        }
    }
}