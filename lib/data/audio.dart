import 'package:dgq/models/audio_metadata.dart';
import 'package:just_audio/just_audio.dart';

final List<AudioSource> audioSource = [
  AudioSource.uri(
    Uri.parse(
        'https://firebasestorage.googleapis.com/v0/b/dg-q-7815c.appspot.com/o/Mimich_Blues.mp3?alt=media&token=1a6d329e-881a-441f-843e-4b274087ea10'
        // scheme: 'asset',
        // path: 'assets/Mimich_Blues.mp3',
        ),
    tag: const AudioMetadata(
        'assets/miscellanees.jpg',
        'Miscellanées',
        'Mimich Blues',
        "https://denisgancelquartet.bandcamp.com/album/miscellan-es"),
  ),
  AudioSource.uri(
    Uri.parse(
        'https://firebasestorage.googleapis.com/v0/b/dg-q-7815c.appspot.com/o/gavotte.mp3?alt=media&token=ca03837c-9516-4777-b389-b2126ee15142'
        //scheme: 'asset',
        //path: 'assets/gavotte.mp3',
        ),
    tag: const AudioMetadata(
      'assets/bric_a_brac.jpg',
      'Bric à brac',
      'Gavotte arrangée',
      "https://denisgancelquartet.bandcamp.com/album/bric-brac",
    ),
  ),
  AudioSource.uri(
    Uri.parse(
        'https://firebasestorage.googleapis.com/v0/b/dg-q-7815c.appspot.com/o/Deconfinado.mp3?alt=media&token=0062aefe-f67d-43b9-8466-d39950e88021'
        //scheme: 'asset',
        //path: 'assets/Deconfinado.mp3',
        ),
    tag: const AudioMetadata(
      'assets/puzzle.jpg',
      'Puzzle',
      'Deconfinado',
      "https://denisgancelquartet.bandcamp.com/album/puzzle",
    ),
  ),
];
