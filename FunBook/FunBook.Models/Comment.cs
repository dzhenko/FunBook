namespace FunBook.Models
{
    public class Comment
    {
        public int Id { get; set; }

        public string Text { get; set; }

        public int JokeId { get; set; }

        public virtual Joke Joke { get; set; }
    }
}
