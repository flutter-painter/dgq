import 'package:dgq/models/album.dart';
import 'package:dgq/models/song.dart';

const List<Album> albums = [
  Album(AlbumName.BRIC_A_BRAC, bricABracSongs),
  Album(AlbumName.MISCELLANEES, miscellaneesSongs),
  Album(AlbumName.PUZZLE, puzzleSongs),
];

const List<Song> puzzleSongs = [
  const Song('Sortie par gros temps', '03:14'),
  const Song('Nina', '06:34'),
  const Song('Quintaou Express', '06:05'),
  const Song('Ola bijou!', '05:36'),
  const Song('La grande roue', '03:35'),
  const Song('Txapela', '04:31'),
  const Song('Monsieur Ba Moussa', '04:15',
      path: 'assets/audio/Monsieur-Ba-Moussa.mp3'),
  const Song('Angelus', '07:34'),
  const Song('Comme une prière', '04:46'),
  const Song('Il était une fois', '03:44'),
  const Song('Deconfinado', '03:49'),
];

const List<Song> miscellaneesSongs = [Song('', ''), Song('', ''), Song('', '')];

const List<Song> bricABracSongs = [Song('', ''), Song('', ''), Song('', '')];
