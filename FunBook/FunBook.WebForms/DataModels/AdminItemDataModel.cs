using FunBook.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;

namespace FunBook.WebForms.DataModels
{
    public class AdminItemDataModel
    {
        public static Expression<Func<Joke, AdminItemDataModel>> FromItem
        {
            get
            {
                return u => new AdminItemDataModel()
                {
                    Id = u.Id.ToString(),
                    Text = u.Text,
                    Title = u.Title
                };
            }
        }

        public string Id { get; set; }

        public string Text { get; set; }

        public string Title { get; set; }
    }
}