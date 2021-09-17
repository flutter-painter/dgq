import 'package:dgq/models/audio_metadata.dart';
import 'package:just_audio/just_audio.dart';

final List<AudioSource> audioSource = [
  AudioSource.uri(
    Uri(
      scheme: 'asset',
      path: 'assets/Mimich_Blues.mp3',
    ),
    tag: const AudioMetadata(
      'assets/miscellanees.jpg',
      'Miscellanées',
      'Mimich Blues',
    ),
  ),
  AudioSource.uri(
    Uri(
      scheme: 'asset',
      path: 'assets/gavotte.mp3',
    ),
    tag: const AudioMetadata(
      'assets/bric_a_brac.jpg',
      'Bric à brac',
      'Gavotte arrangée',
    ),
  ),
  AudioSource.uri(
    Uri(
      scheme: 'asset',
      path: 'assets/Deconfinado.mp3',
    ),
    tag: const AudioMetadata(
      'assets/puzzle.jpg',
      'Puzzle',
      'Deconfinado',
    ),
  ),
];
