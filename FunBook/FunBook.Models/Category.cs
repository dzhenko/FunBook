using System.Collections.Generic;
namespace FunBook.Models
{
    public class Category
    {
        private ICollection<Joke> jokes;

        public Category()
        {
            this.jokes = new HashSet<Joke>();
        }

        public int Id { get; set; }

        public string Name { get; set; }

        public virtual ICollection<Joke> Jokes 
        {
            get { return this.jokes; }
            set { this.jokes = value; }
        }
    }
}
