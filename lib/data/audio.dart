import 'package:dgq/models/audio_metadata.dart';
import 'package:just_audio/just_audio.dart';

final List<AudioSource> audioSource = [
  AudioSource.uri(
    Uri(
      scheme: 'asset',
      path: 'assets/Mimich_Blues.mp3',
    ),
    tag: AudioMetadata(
      'assets/miscellanees.jpg',
      'Miscellanées',
      'Mimich Blues',
    ),
  ),
  AudioSource.uri(
    Uri(
      scheme: 'asset',
      path: 'assets/Premier_argent_de_poche.mp3',
    ),
    tag: AudioMetadata(
      'assets/bric_a_brac.jpg',
      'Bric à brac',
      'Premier argent de poche',
    ),
  ),
  AudioSource.uri(
    Uri(
      scheme: 'asset',
      path: 'assets/Deconfinado.mp3',
    ),
    tag: AudioMetadata(
      'assets/puzzle.jpg',
      'Puzzle',
      'Deconfinado',
    ),
  ),
];
