namespace FunBook.Data
{
    using System;
    using System.Linq;

    using FunBook.Data.Repositories;
    using FunBook.Models;

    public interface IFunBookData
    {
        IRepository<Joke> Jokes { get; }

        IRepository<Comment> Comments { get; }

        IRepository<JokeView> JokeViews { get; }

        IRepository<Category> Categories { get; }

        // IRepository<User> Users { get; }

        void SaveChanges();
    }
}
