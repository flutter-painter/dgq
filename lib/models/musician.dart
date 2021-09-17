class Musician {
  final String firstName;
  final String lastName;
  final String instrument;
  final String bio;
  final String photoPath;
  final bool isQuartet;
  Musician(
      this.firstName, this.lastName, this.instrument, this.bio, this.photoPath,
      {this.isQuartet});
}

List<Musician> musicians = [
  Musician(
    "Denis",
    "Gancel",
    "compo & piano",
    """
Denis Gancel has a classical musician training, 
he conducts orchestra at the age of 18 and joins the Ecole Normale de Musique in Paris 
in the piano class of Jeannine Bonjean. 
He meets Jacques Loussier in 1985 who becomes his friend and mentor. 
Jacques Loussier invites Denis Gancel to chart his own musical route.
    """,
    'assets/musicians/denis.png',
    isQuartet: true,
  ),
  Musician(
    "Nicolas",
    "Chelly",
    "basse",
    "",
    'assets/musicians/nicolas.png',
    isQuartet: true,
  ),
  Musician(
    "Philippe",
    "Nadeau",
    "clarinette & saxo",
    "",
    'assets/musicians/philippe.png',
    isQuartet: true,
  ),
  Musician(
    "Idehiko",
    "Kan",
    "batterie",
    "",
    'assets/musicians/idehiko.png',
    isQuartet: true,
  ),
  Musician(
    "Frank",
    "Delpeuh",
    "trompette",
    "",
    'assets/musicians/frank.png',
    isQuartet: false,
  ),
  Musician(
    "Luis",
    "Camino",
    "percussions",
    "",
    'assets/musicians/luis.png',
    isQuartet: false,
  ),
  Musician(
    "Inaki",
    "...",
    "accordéon",
    "",
    'assets/musicians/inaki.png',
    isQuartet: false,
  ),
];
