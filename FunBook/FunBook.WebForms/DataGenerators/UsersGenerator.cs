namespace FunBook.WebForms.DataGenerators
{
    using System;
    using System.Linq;
    using System.Web;

    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.Owin;

    using FunBook.Data;
    using FunBook.Models;

    public class UsersGenerator : IDataGenerator
    {
        public void Generate(FunBookDbContext context)
        {
            var manager = HttpContext.Current.GetOwinContext().GetUserManager<UserManager>();
            manager.Create(new User() { UserName = "admin", Email = "admin@admin.com" }, "qwerty");

            manager.Create(new User() { UserName = "qwe", Email = "qwe@qwe.com" }, "qwe");
        }
    }
}
