using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace TestASCX.HoverDetails
{
    public partial class TestHoverDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.HoverDetails.ItemsToShow = Joke.GetJokes();
        }

        public IEnumerable<Joke> Repeater_GetData()
        {
            return Joke.GetJokes();
        }

        
    }

    public class Joke
    {
        public static IEnumerable<Joke> GetJokes()
        {
            return new List<Joke>()
            {
                new Joke() {DownVotes=31, UpVotes=7,Views=21, Id="1", Title="MuterFucking", Text="Lorem ipsum is a dummy text used to represent a string of meaningless characters, used by every "},
                new Joke() {DownVotes=38, UpVotes=17,Views=31, Id="2", Title="Drogha", Text="Lorem ipsum is a dummy text used to represent a string of meaningless characters, used by every "},
                new Joke() {DownVotes=37, UpVotes=27,Views=41, Id="3", Title="Ramstain", Text="Lorem ipsum is a dummy text used to represent a string of meaningless characters, used by every "},
                new Joke() {DownVotes=36, UpVotes=37,Views=22, Id="4", Title="The People", Text="Lorem ipsum is a dummy text used to represent a string of meaningless characters, used by every "},
                new Joke() {DownVotes=35, UpVotes=7,Views=23, Id="5", Title="Everyone", Text="Lorem ipsum is a dummy text used to represent a string of meaningless characters, used by every "},
                new Joke() {DownVotes=34, UpVotes=27,Views=24, Id="6", Title="RandomGUy", Text="Lorem ipsum is a dummy text used to represent a string of meaningless characters, used by every "},
                new Joke() {DownVotes=33, UpVotes=37,Views=25, Id="7", Title="SomeTitle", Text="Lorem ipsum is a dummy text used to represent a string of meaningless characters, used by every "},
                new Joke() {DownVotes=32, UpVotes=47,Views=26, Id="8", Title="Breadcrums", Text="Lorem ipsum is a dummy text used to represent a string of meaningless characters, used by every "},
                new Joke() {DownVotes=31, UpVotes=17,Views=27, Id="9", Title="WizKalifa", Text="Lorem ipsum is a dummy text used to represent a string of meaningless characters, used by every "},
            };
        }

        public string Title { get; set; }

        public string Text { get; set; }

        public int Views { get; set; }

        public int UpVotes { get; set; }

        public int DownVotes { get; set; }

        public string Id { get; set; }
    }
}