import 'package:dgq/models/song.dart';

class AlbumName {
  final String _name;
  const AlbumName._(this._name);
  toString() => '${this._name}';
  static const MISCELLANEES = const AlbumName._('miscellanees');
  static const BRIC_A_BRAC = const AlbumName._('bric_a_brac');
  static const PUZZLE = const AlbumName._('puzzle');
  static const ALBUMS = [MISCELLANEES, BRIC_A_BRAC, PUZZLE];
}

class Album {
  final AlbumName name;
  final List<Song> songs;
  const Album(this.name, this.songs);
}
