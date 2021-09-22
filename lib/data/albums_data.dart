import 'package:dgq/models/album.dart';
import 'package:dgq/models/song.dart';

const List<Album> albums = [
  Album(AlbumName.BRIC_A_BRAC, bricABracSongs),
  Album(AlbumName.MISCELLANEES, miscellaneesSongs),
  Album(AlbumName.PUZZLE, puzzleSongs),
];

const List<Song> puzzleSongs = [
  const Song(
    'Sortie par gros temps',
    '03:14',
  ),
  const Song('Nina', '06:34'),
  const Song('Quintaou Express', '06:05'),
  const Song('Ola bijou!', '05:36'),
  const Song('La grande roue', '03:35'),
  const Song('Txapela', '04:31'),
  const Song('Monsieur Ba Moussa', '04:15',
      path: 'assets/Monsieur-Ba-Moussa.mp3'),
  const Song('Angelus', '07:34'),
  const Song('Comme une prière', '04:46'),
  const Song('Il était une fois', '03:44'),
  const Song('Deconfinado', '03:49'),
];

const List<Song> miscellaneesSongs = [
  Song(' Le Vélo Jaune', ''),
  Song('L\'Accordeur', ''),
  Song('Trop Cool L\'océan', ''),
  Song('Lazy Afternoons Chant feat. Yasmin Shah', ''),
  Song('Mimich_ Blues', ''),
  Song('Face', ''),
  Song('Bataclan', ''),
  Song('Le Moucharabieh', ''),
  Song('En Allant Danser', ''),
  Song('A Flash Back Of You - Yasmin Shah', ''),
  Song('La Terreur Des Mouches À Gâteaux', ''),
];

const List<Song> bricABracSongs = [
  Song('Gavotte arrangée', ''),
  Song('Aguilera', ''),
  Song('Baroque à souhait', ''),
  Song('Belharra', ''),
  Song('Choralito', ''),
  Song('Gipsy Look', ''),
  Song('Hegoaldean Bista', ''),
  Song('Ibaia', ''),
  Song('Il go', ''),
  Song('Mr Ba Moussa', ''),
  Song('Premier argent de poche', ''),
];
