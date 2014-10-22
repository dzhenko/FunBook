namespace FunBook.WebForms.DataModels
{
    using System;
    using System.Linq;
    using System.Linq.Expressions;

    using FunBook.Models;

    public class HomeItemDataModel
    {
        public static Expression<Func<Joke, HomeItemDataModel>> FromJoke
        {
            get
            {
                return j => new HomeItemDataModel()
                {
                    Id = j.Id.ToString(),
                    Title = j.Title,
                    Content = j.Text,
                    Created = j.Created
                };
            }
        }

        public static Expression<Func<Link, HomeItemDataModel>> FromLink
        {
            get
            {
                return l => new HomeItemDataModel()
                {
                    Id = l.Id.ToString(),
                    Title = l.Title,
                    Content = l.URL,
                    Created = l.Created
                };
            }
        }

        public static Expression<Func<Picture, HomeItemDataModel>> FromPicture
        {
            get
            {
                return p => new HomeItemDataModel()
                {
                    Id = p.Id.ToString(),
                    Title = p.Title,
                    Content = p.UrlPath,
                    Created = p.Created
                };
            }
        }

        public string Id { get; set; }

        public string Title { get; set; }

        public string Content { get; set; }

        public DateTime Created { get; set; }
    }
}