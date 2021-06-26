import 'package:dgq/models/song.dart';

class AlbumName {
  final String _name;
  const AlbumName._(this._name);
  toString() => '${this._name}';
  toCleanString() => this
      ._name
      .toString()
      .toLowerCase()
      .replaceAll(RegExp(r' '), '_')
      .replaceAll(RegExp(r'é'), 'e')
      .replaceAll(RegExp(r'à'), 'a')
      .replaceAll(RegExp(r'î'), 'i')
      .replaceAll(RegExp(r'ô'), 'o');

  static const MISCELLANEES = const AlbumName._('Miscéllanées'); // miscellanees
  static const BRIC_A_BRAC = const AlbumName._('Bric à brac'); // bric_a_brac
  static const PUZZLE = const AlbumName._('Puzzle'); //puzzle
  static const ALBUMS = [MISCELLANEES, BRIC_A_BRAC, PUZZLE];
}

class Album {
  final AlbumName name;
  final List<Song> songs;
  const Album(this.name, this.songs);
}
