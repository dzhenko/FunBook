namespace FunBook.Data
{
    using System;
    using System.Linq;

    using FunBook.Data.Repositories;
    using FunBook.Models;

    public interface IFunBookData
    {
        IRepository<Joke> Jokes { get; }

        IRepository<Picture> Pictures { get; }

        IRepository<Link> Links { get; }

        IRepository<Tag> Tags { get; }

        IRepository<Comment> Comments { get; }

        IRepository<View> Views { get; }

        IRepository<Category> Categories { get; }

        // IRepository<User> Users { get; }

        void SaveChanges();
    }
}