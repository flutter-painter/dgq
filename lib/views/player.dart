import 'package:dgq/data/audio.dart';
import 'package:dgq/globals.dart' as globals;
import 'package:dgq/constants.dart';
import 'package:dgq/style.dart';
import 'package:dgq/models/audio_metadata.dart';
import 'package:dgq/theme/background.dart';
// import 'package:dgq/views/about.dart';
import 'package:dgq/widgets/music_controls.dart';
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
  final _cardHeight = minCardHeight;
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

  Widget buildPlayerCard() => Positioned(
        top: globals.screenHeight(context) * .5,
        child: FractionalTranslation(
          translation: Offset(0, -.5),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: AnimatedContainer(
                  width: maxCardHeight,
                  height: _cardHeight, // ? minCardHeight
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: background.evaluate(
                      AlwaysStoppedAnimation(
                        currentIndex / audioSource.length,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );

  Widget _buildArtwork(String artwork) => artwork.isEmpty
      ? const SizedBox()
      : AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child: Container(
            key: Key(artwork),
            width: artWorkDi,
            height: artWorkDi,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(artwork)),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x142196F3),
                    offset: Offset(0, 40),
                    blurRadius: 40,
                  ),
                ]),
          ),
          transitionBuilder: (child, animation) {
            return RotationTransition(
              turns: animation,
              alignment: Alignment.center,
              child: FadeTransition(opacity: animation, child: child),
            );
          },
        );

  Widget _buildMetaData() => StreamBuilder<SequenceState?>(
        stream: _player.sequenceStateStream,
        builder: (context, snapshot) {
          final state = snapshot.data;
          if (state?.sequence.isEmpty ?? true) {
            return const SizedBox();
          } else {
            final metadata = state!.currentSource!.tag as AudioMetadata;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildArtwork(metadata.artwork),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 600),
                    switchInCurve: Curves.bounceIn,
                    child: Text(
                      metadata.title,
                      key: Key(metadata.title),
                      style: textStyleTitle,
                    ),
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 600),
                    switchInCurve: Curves.bounceIn,
                    child: Text(
                      metadata.album,
                      style: textStyleAlbum,
                      key: Key(metadata.album),
                    ),
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      );

  Widget buildPlayerContent() => Positioned(
        top: (globals.screenHeight(context) / 2) -
            (minCardHeight / 2 + artWorkDi / 2),
        width: maxCardHeight - (defaultPadding * 3),
        child: Column(
          children: [
            _buildMetaData(),
            SizedBox(height: defaultPadding),
            MusicControls(player: _player),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.bottomCenter,
      children: [
        buildPlayerCard(),
        buildPlayerContent(),
      ],
    );
  }
}
