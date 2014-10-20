namespace FunBook.Data.Migrations
{
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

        protected override void Seed(FunBook.Data.FunBookDbContext context)
        {
            if (!context.Categories.Any())
            {
                context.Categories.Add(new Models.Category() { Name = "Blonds" });
                context.Categories.Add(new Models.Category() { Name = "Big Brother" });
                context.Categories.Add(new Models.Category() { Name = "Microsoft" });
                context.Categories.Add(new Models.Category() { Name = "Animals" });
                context.Categories.Add(new Models.Category() { Name = "Dirty" });
                context.Categories.Add(new Models.Category() { Name = "Chuck Noris" });
            }
        }
    }
}
