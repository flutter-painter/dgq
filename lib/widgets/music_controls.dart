import 'dart:math';
import 'package:dgq/models/position_data.dart';
import 'package:dgq/widgets/seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

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
    super.dispose();
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 64,
              height: 64,
              child: StreamBuilder<SequenceState>(
                stream: _player.sequenceStateStream,
                builder: (context, snapshot) => IconButton(
                  icon: Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                    size: 33,
                  ),
                  onPressed:
                      _player.hasPrevious ? _player.seekToPrevious : null,
                ),
              ),
            ),
            StreamBuilder<PlayerState>(
              stream: _player.playerStateStream,
              builder: (context, snapshot) {
                final playerState = snapshot.data;
                final processingState = playerState?.processingState;
                final playing = playerState?.playing;
                if (processingState == ProcessingState.loading ||
                    processingState == ProcessingState.buffering) {
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    width: 64.0,
                    height: 64.0,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                } else if (playing != true ||
                    processingState != ProcessingState.completed) {
                  return SizedBox(
                    width: 70,
                    height: 70,
                    child: InkWell(
                      onTap: () {
                        if (!playing) {
                          controller.forward();
                          _player.play();
                        }
                        if (playing &&
                            processingState != ProcessingState.completed) {
                          controller.reverse();
                          _player.pause();
                        }
                      },
                      child: AnimatedIcon(
                        icon: AnimatedIcons.play_pause,
                        progress: curve,
                        size: 64,
                        color: Colors.white,
                      ),
                    ),
                  );
                } else {
                  return IconButton(
                    icon: Icon(Icons.replay, color: Colors.white),
                    iconSize: 64.0,
                    onPressed: () => _player.seek(Duration.zero,
                        index: _player.effectiveIndices.first),
                  );
                }
              },
            ),
            StreamBuilder<SequenceState>(
              stream: _player.sequenceStateStream,
              builder: (context, snapshot) => SizedBox(
                width: 70,
                height: 70,
                child: _player.hasNext
                    ? IconButton(
                        icon: Icon(
                          Icons.skip_next,
                          color: Colors.white,
                          size: 33,
                        ),
                        onPressed: _player.hasNext ? _player.seekToNext : null,
                      )
                    : const SizedBox(),
              ),
            ),
          ],
        ),
        StreamBuilder<PositionData>(
          stream: _positionDataStream,
          builder: (context, snapshot) {
            final positionData = snapshot.data;
            return SeekBar(
              duration: positionData?.duration ?? Duration.zero,
              position: positionData?.position ?? Duration.zero,
              bufferedPosition: positionData?.bufferedPosition ?? Duration.zero,
              onChangeEnd: (newPosition) {
                _player.seek(newPosition);
              },
            );
          },
        ),
      ],
    );
  }
}
