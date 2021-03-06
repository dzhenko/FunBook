﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FunBook.Data.Repositories
{
    using System.Data.Entity;
    using System.Linq;

    public class EFRepository<T> : IRepository<T> where T : class
    {
        private FunBookDbContext context;
        private IDbSet<T> set;

        public EFRepository()
            : this(new FunBookDbContext())
        {
        }

        public EFRepository(FunBookDbContext context)
        {
            this.context = context;
            this.set = context.Set<T>();
        }

        public IQueryable<T> All()
        {
            return this.set;
        }

        public void Add(T entity)
        {
            this.ChangeEntityState(entity, EntityState.Added);
        }

        public T Find(object id)
        {
            return this.set.Find(id);
        }

        public void Update(T entity)
        {
            this.ChangeEntityState(entity, EntityState.Modified);
        }

        public T Delete(T entity)
        {
            this.ChangeEntityState(entity, EntityState.Deleted);
            return entity;
        }

        public void Detach(T entity)
        {
            this.ChangeEntityState(entity, EntityState.Detached);
        }

        public void SaveChanges()
        {
            this.context.SaveChanges();
        }

        private void ChangeEntityState(T entity, EntityState state)
        {
            var entry = this.context.Entry(entity);
            if (entry.State == EntityState.Detached)
            {
                this.set.Attach(entity);
            }

            entry.State = state;
        }
    }
}
