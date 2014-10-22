namespace FunBook.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    using System.Linq;

    using FunBook.Data.InitialDataGenerators;

    internal sealed class Configuration : DbMigrationsConfiguration<FunBook.Data.FunBookDbContext>
    {
        public Configuration()
        {
            this.AutomaticMigrationsEnabled = true;
            this.AutomaticMigrationDataLossAllowed = true;
        }

        protected override void Seed(FunBookDbContext context)
        {
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
