using System;
namespace FunBook.Models
{
    public class Comment
    {
        public Comment()
        {
            this.Created = DateTime.Now;
        }

        public int Id { get; set; }

        public string Text { get; set; }

        public string UserId { get; set; }

        public DateTime Created { get; set; }
    }
}
