import 'package:dgq/models/song.dart';
import 'package:dgq/utils/without_accents.dart';

class AlbumName {
  final String? _name;

  const AlbumName._(this._name);
  toString() => '${this._name!}';
  toCleanString() => withoutAccents(
        this._name!.toString().toLowerCase().replaceAll(RegExp(r' '), '_'),
      );

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
