namespace FunBook.WebForms.DataModels
{
    using System;
    using System.Linq;
    using System.Linq.Expressions;

    using FunBook.Models;

    public class FunMasterTagItemDataModel
    {
        public static Expression<Func<Tag, FunMasterTagItemDataModel>> FromTag
        {
            get
            {
                return t => new FunMasterTagItemDataModel()
                {
                    Id = t.Id,
                    Name = t.Name,
                    Count = t.Jokes.Count() + t.Links.Count() + t.Pictures.Count()
                };
            }
        }

        public int Id { get; set; }

        public string Name { get; set; }

        public int Count { get; set; }
    }
}