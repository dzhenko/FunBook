namespace FunBook.Data
{
    using System;
    using System.Data.Entity;

    using FunBook.Models;

    public class FunBookDbContext : DbContext
    {
        public FunBookDbContext()
            : base("FunBookConnection")
        {
            //Database.SetInitializer<MasterChefDbContext>(new MigrateDatabaseToLatestVersion<MasterChefDbContext, Configuration>());
        }

        public IDbSet<Joke> PreparationSteps { get; set; }

        public IDbSet<JokeView> JokeView { get; set; }

        public IDbSet<Category> Categories { get; set; }
    }
}
