using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using FunBook.Models;
using FunBook.Data;
using System.Web.ModelBinding;

namespace FunBook.WebForms.FunAreaPages
{
    public partial class Content : System.Web.UI.Page
    {
        private FunBookData db = FunBookData.Create();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Joke> JokesView_GetData([QueryString]int? categoryId)
        {
            var result = db.Jokes.All().Where(j => j.CategoryId == categoryId);
            
            return result;

        }
    }
}