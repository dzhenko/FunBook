using FunBook.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FunBook.WebForms.DataGenerators
{
    public static class DataConfig
    {
        public static void RegisterData()
        {
            var context = new FunBookDbContext();

            if (!context.Roles.Any())
            {
                (new RolesGenerator()).Generate(context);
            }

            if (!context.Users.Any())
            {
                (new UsersGenerator()).Generate(context);
            }

            if (!context.Jokes.Any())
            {
                (new JokesGenerator()).Generate(context);
            }

            if (!context.Links.Any())
            {
                (new LinksGenerator()).Generate(context);
            }

            if (!context.Pictures.Any())
            {
                (new PicturesGenerator()).Generate(context);
            }
        }
    }
}