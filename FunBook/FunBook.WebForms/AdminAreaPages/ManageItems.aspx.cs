namespace FunBook.WebForms.AdminAreaPages
{
    using System;
    using System.Linq;
    using System.Web.UI.WebControls;

    using FunBook.Data;
    using FunBook.WebForms.DataModels;

    public partial class ManageItems : System.Web.UI.Page
    {
        FunBookData data;

        public ManageItems()
        {
            this.data = FunBookData.Create();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ListView_Sorting(object sender, ListViewSortEventArgs e)
        {

        }

        public IQueryable<AdminItemDataModel> ListView_GetData()
        {
            string idStr = Request.QueryString["q"];
            if (idStr == null)
            {
                return this.data.Jokes.All().Select(AdminItemDataModel.FromItem);
            }
            else
            {
                return this.data.Jokes.All().Where(x => x.Text.Contains(idStr)).Select(AdminItemDataModel.FromItem);
            }
        }

        public void ListView_UpdateItem(object id)
        {
            FunBook.Models.Joke item = null;

            item = this.data.Jokes.Find(Guid.Parse(id.ToString()));
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

        public void ListView_DeleteItem(object id)
        {
            this.HiddenfieldDeleteId.Text = id.ToString();

            this.ModalWindow.Show();
        }

        protected void ModalWindow_OKButtonClicked(object sender, EventArgs e)
        {
            FunBook.Models.Joke item = null;

            var id = this.HiddenfieldDeleteId.Text;

            item = this.data.Jokes.Find(Guid.Parse(id));
            if (item == null)
            {
                ModelState.AddModelError("", String.Format("Joke with id {0} was not found", id));
                return;
            }

            this.data.Jokes.Delete(item);
            this.data.SaveChanges();

            DataBind();
        }

        protected void LinkButtonSearch_Click(object sender, EventArgs e)
        {
            TextBox textbox = (TextBox)this.ListView.FindControl("TextBoxSearch");
            string query = string.Format("?q={0}", textbox.Text);
            Response.Redirect("~/AdminAreaPages/ManageItems" + query);
        }
    }
}