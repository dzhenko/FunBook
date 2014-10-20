namespace FunBook.Models
{
    using System;

    public class Joke
    {
        public int Id { get; set; }

        public string Text { get; set; }

        public int CategoryId { get; set; }

        public virtual Category Category { get; set; }
    }
}
