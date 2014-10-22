namespace FunBook.Data.Migrations
{
    using FunBook.Data.InitialDataGenerators;
    using FunBook.Models;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<FunBook.Data.FunBookDbContext>
    {
        public Configuration()
        {
            this.AutomaticMigrationsEnabled = true;
            this.AutomaticMigrationDataLossAllowed = true;
        }

        protected override void Seed(FunBookDbContext context)
        {
            if (!context.Categories.Any())
            {
                (new JokesGenerator()).Generate(context);
            }
        }
    }
}
