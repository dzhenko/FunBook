namespace FunBook.Data
{
    using System;
    using System.Data.Entity;

    using FunBook.Models;
    using FunBook.Data.Migrations;

    public class FunBookDbContext : DbContext
    {
        public FunBookDbContext()
            : base("FunBookConnection")
        {
            Database.SetInitializer<FunBookDbContext>(new MigrateDatabaseToLatestVersion<FunBookDbContext, Configuration>());
        }

        public IDbSet<Joke> Jokes { get; set; }

        public IDbSet<Picture> Pictures { get; set; }

        public IDbSet<Link> Links { get; set; }

        public IDbSet<View> Views { get; set; }

        public IDbSet<Tag> Tags { get; set; }

        public IDbSet<Comment> Comments { get; set; }

        public IDbSet<Category> Categories { get; set; }
    }
}
