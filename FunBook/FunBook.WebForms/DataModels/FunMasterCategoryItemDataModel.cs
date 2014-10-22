namespace FunBook.WebForms.DataModels
{
    using System;
    using System.Linq;
    using System.Linq.Expressions;

    using FunBook.Models;

    public class FunMasterCategoryItemDataModel
    {
        public static Expression<Func<Category, FunMasterCategoryItemDataModel>> FromCategory
        {
            get
            {
                return c => new FunMasterCategoryItemDataModel()
                {
                    Id = c.Id,
                    Name = c.Name,
                    Count = c.Jokes.Count() + c.Links.Count() + c.Pictures.Count()
                };
            }
        }

        public int Id { get; set; }

        public string Name { get; set; }

        public int Count { get; set; }
    }
}