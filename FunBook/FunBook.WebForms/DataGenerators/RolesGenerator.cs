namespace FunBook.WebForms.DataGenerators
{
    using System;
    using System.Linq;

    using System.Web;
    using FunBook.Data;
    using FunBook.WebForms;
    using Microsoft.AspNet.Identity.Owin;
    using Microsoft.AspNet.Identity.EntityFramework;
    using Microsoft.AspNet.Identity;

    public class RolesGenerator : IDataGenerator
    {
        public void Generate(FunBookDbContext context)
        {
            var userStore = new UserStore<IdentityUser>();
            var userManager = new UserManager<IdentityUser>(userStore);

            context.Roles.Add(new Microsoft.AspNet.Identity.EntityFramework.IdentityRole() { Name = "admin" });
            context.SaveChanges();

            foreach (var userId in context.Users.Select(u => u.Id))
            {
                userManager.AddToRoleAsync(userId, "admin");
            }
        }
    }
}
