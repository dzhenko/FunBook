namespace FunBook.Models
{
    public class JokeView
    {
        public int Id { get; set; }

        public bool? Liked { get; set; }

        public int JokeId { get; set; }

        public virtual Joke Joke { get; set; }
    }
}
