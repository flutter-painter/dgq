class Musician {
  final String firstName;
  final String lastName;
  final String instrument;
  final String bio;
  Musician(this.firstName, this.lastName, this.instrument, this.bio);
}

List<Musician> musicians = [
  Musician("Nicolas", "Chelly", "basse", ''),
  Musician("Philippe", "Nadeau", "vents", ""),
  Musician("Idehiko", "Kan", "batterie", ""),
  Musician("Denis", "Gancel", "piano", ""),
];
