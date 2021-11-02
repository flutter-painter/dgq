import 'package:dgq/data/audio.dart';
import 'package:dgq/widgets/player/player_card.dart';
import 'package:dgq/widgets/player/player_content.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerView extends StatefulWidget {
  PlayerView({Key? key}) : super(key: key);

  @override
  _PlayerViewState createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  late AudioPlayer _player;
  late int currentIndex = 0;

  final _playlist = ConcatenatingAudioSource(
    children: audioSource,
    useLazyPreparation: false,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    _player = AudioPlayer();
    _init();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    _player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _player.stop();
    } else if (state == AppLifecycleState.resumed) {
      _player.stop();
    }
  }

  Future<void> _init() async {
    _player.sequenceStateStream.listen((event) {
      setState(() {
        currentIndex = event?.currentIndex ?? 0;
      });
    });
    try {
      await _player.setAudioSource(
        _playlist,
        preload: false,
        initialIndex: 0,
      );
    } catch (e) {
      print('Error loading audio source : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.bottomCenter,
      children: [
        PlayerCard(currentIndex),
        PlayerContent(_player),
      ],
    );
  }
}
