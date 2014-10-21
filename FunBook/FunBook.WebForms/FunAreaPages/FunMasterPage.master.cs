using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using FunBook.Data;

namespace FunBook.WebForms.FunAreaPages
{
    public partial class FunMasterPage : MasterPage
    {
        FunBookData db = FunBookData.Create();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            categories.DataSource = db.Categories.All().ToList();
            categories.DataBind();
        }
    }
}