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
                    Created = j.Created,
                    DetailsUrl = "JokeDetails?jokeId=" + j.Id.ToString()
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
                    Created = l.Created,
                    DetailsUrl = "LinkDetails?linkId=" + l.Id.ToString()
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
                    Created = p.Created,
                    DetailsUrl = "PictureDetails?picId=" + p.Id.ToString()
                };
            }
        }

        public string Id { get; set; }

        public string Title { get; set; }

        public string Content { get; set; }

        public DateTime Created { get; set; }

        public string DetailsUrl { get; set; }
    }
}