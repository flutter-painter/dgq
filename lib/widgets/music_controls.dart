import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MusicControls extends StatefulWidget {
  final AudioPlayer player;
  MusicControls({this.player, Key key}) : super(key: key);

  @override
  _MusicControlsState createState() => _MusicControlsState();
}

class _MusicControlsState extends State<MusicControls>
    with SingleTickerProviderStateMixin {
  AudioPlayer _player;
  AnimationController controller;
  Animation<double> curve;
  bool flag = true;

  @override
  void initState() {
    _player = widget.player;
    controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    curve = CurvedAnimation(
        parent: controller, curve: Curves.fastLinearToSlowEaseIn);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    _player.dispose();
    super.dispose();
  }

  Widget _buildControlButtons() {
    return StreamBuilder<PlayerState>(
        stream: _player.playerStateStream,
        builder: (context, snapshot) {
          final playerState = snapshot.data;
          final processingState = playerState?.processingState;
          final isPlaying = playerState?.playing;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: GestureDetector(
                  onTap: () async {
                    await _player.seekToPrevious();
                  },
                  child: Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                    size: 33,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () =>
                    _playPauseButtonPressed(isPlaying, processingState),
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: AnimatedIcon(
                    icon: AnimatedIcons.play_pause,
                    progress: curve,
                    size: 64,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 70,
                height: 70,
                child: GestureDetector(
                  onTap: () async {
                    print('_player.currentIndex ${_player.currentIndex}');
                    await _player.seekToNext();
                    print('_player.currentIndex after ${_player.currentIndex}');
                  },
                  child: Icon(
                    Icons.skip_next,
                    color: Colors.white,
                    size: 33,
                  ),
                ),
              ),
            ],
          );
        });
  }

  void _playPauseButtonPressed(playing, processingState) {
    if (!playing) {
      controller.forward();
      _player.play();
      flag = true;
    } else {
      controller.reverse();
      Future.delayed(Duration(milliseconds: 600), () {
        _player.stop();
      });
      flag = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildControlButtons(),
      ],
    );
  }
}
