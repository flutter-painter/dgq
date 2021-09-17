import 'package:dgq/models/audio_metadata.dart';
import 'package:just_audio/just_audio.dart';

List<AudioSource> audioSource = [
  AudioSource.uri(
    Uri.file('assets/Mimich_Blues.mp3'),
    tag: AudioMetadata(
        'assets/miscellanees.jpg', 'Miscellanées', 'Mimich Blues'),
  ),
  AudioSource.uri(
    Uri.file('assets/Monsieur-Ba-Moussa.mp3'),
    tag: AudioMetadata(
        'assets/bric_a_brac.jpg', 'Bric à brac', 'Monsieur Ba Moussa'),
  ),
  AudioSource.uri(
    Uri.file('assets/Deconfinado.mp3'),
    tag: AudioMetadata('assets/puzzle.jpg', 'Puzzle', 'Deconfinado'),
  ),
];
