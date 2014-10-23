namespace FunBook.WebForms.DataModels
{
    using System;
    using System.Linq;
    using System.Linq.Expressions;

    using FunBook.Models;

    public class AllItemDataModel
    {
        public static Expression<Func<Joke, AllItemDataModel>> FromJoke
        {
            get
            {
                return j => new AllItemDataModel()
                {
                    Id = j.Id.ToString(),
                    Title = j.Title,
                    Content = j.Text,
                    Created = j.Created,
                    DetailsUrl = "JokeDetails?jokeId=" + j.Id.ToString(),
                    DownVotes = j.Views.Count(v => v.Liked == false),
                    UpVotes = j.Views.Count(v => v.Liked == true),
                    Views = j.Views.Count()
                };
            }
        }

        public static Expression<Func<Link, AllItemDataModel>> FromLink
        {
            get
            {
                return l => new AllItemDataModel()
                {
                    Id = l.Id.ToString(),
                    Title = l.Title,
                    Content = l.URL,
                    Created = l.Created,
                    DetailsUrl = "LinkDetails?linkId=" + l.Id.ToString(),
                    DownVotes = l.Views.Count(v => v.Liked == false),
                    UpVotes = l.Views.Count(v => v.Liked == true),
                    Views = l.Views.Count()
                };
            }
        }

        public static Expression<Func<Picture, AllItemDataModel>> FromPicture
        {
            get
            {
                return p => new AllItemDataModel()
                {
                    Id = p.Id.ToString(),
                    Title = p.Title,
                    Content = p.UrlPath,
                    Created = p.Created,
                    DetailsUrl = "PictureDetails?picId=" + p.Id.ToString(),
                    DownVotes = p.Views.Count(v => v.Liked == false),
                    UpVotes = p.Views.Count(v => v.Liked == true),
                    Views = p.Views.Count()
                };
            }
        }

        public string Id { get; set; }

        public string Title { get; set; }

        public string Content { get; set; }

        public DateTime Created { get; set; }

        public string DetailsUrl { get; set; }

        public int DownVotes { get; set; }

        public int UpVotes { get; set; }

        public int Views { get; set; }
    }
}