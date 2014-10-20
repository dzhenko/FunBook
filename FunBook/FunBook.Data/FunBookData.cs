namespace FunBook.Data
{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    using FunBook.Data.Repositories;
    using FunBook.Models;

    public class FunBookData : IFunBookData
    {
        private FunBookDbContext context;
        private IDictionary<Type, object> repositories;

        public FunBookData(FunBookDbContext context)
        {
            this.context = context;
            this.repositories = new Dictionary<Type, object>();
        }

        public FunBookData()
            : this(new FunBookDbContext())
        {
        }

        public IRepository<Joke> Jokes
        {
            get
            {
                return this.GetRepository<Joke>();
            }
        }

        public IRepository<Comment> Comments
        {
            get
            {
                return this.GetRepository<Comment>();
            }
        }

        public IRepository<JokeView> JokeViews
        {
            get
            {
                return this.GetRepository<JokeView>();
            }
        }

        public IRepository<Category> Categories
        {
            get
            {
                return this.GetRepository<Category>();
            }
        }

        //public IRepository<User> Users
        //{
        //    get
        //    {
        //        return this.GetRepository<User>();
        //    }
        //}

        public void SaveChanges()
        {
            this.context.SaveChanges();
        }

        private IRepository<T> GetRepository<T>() where T : class
        {
            var typeOfModel = typeof(T);

            if (!this.repositories.ContainsKey(typeOfModel))
            {
                this.repositories.Add(typeOfModel, Activator.CreateInstance(typeof(EFRepository<T>), this.context));
            }

            return (IRepository<T>)this.repositories[typeOfModel];
        }
    }
}
