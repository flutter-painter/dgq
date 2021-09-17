import 'package:dgq/data/audio.dart';
import 'package:dgq/models/album.dart';
import 'package:dgq/globals.dart' as globals;
import 'package:dgq/constants.dart';
import 'package:dgq/style.dart';
import 'package:dgq/models/audio_metadata.dart';
import 'package:dgq/theme/background.dart';
import 'package:dgq/widgets/music_controls.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Player extends StatefulWidget {
  Player({Key key}) : super(key: key);

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> with WidgetsBindingObserver {
  AudioPlayer _player;
  final _cardHeight = minCardHeight;

  int currentIndex = 0;

  ConcatenatingAudioSource _playlist =
      ConcatenatingAudioSource(children: audioSource);

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
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _player.stop();
    }
  }

  Future<void> _init() async {
    _player.sequenceStateStream.listen((event) {
      setState(() {
        currentIndex = event?.currentIndex;
      });
    });
    try {
      await _player.setAudioSource(_playlist);
    } catch (e) {
      print('Error loading audio source : $e');
    }
  }

  Widget _buildGradientBackground() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      decoration: BoxDecoration(
        gradient: background.evaluate(
          AlwaysStoppedAnimation(
            currentIndex / audioSource.length,
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerCard() {
    return Positioned(
        top: MediaQuery.of(context).size.height * .5,
        child: FractionalTranslation(
          translation: Offset(0, -.5),
          child: Stack(
            children: [
              Positioned(
                width: cardWidth,
                height: minCardHeight * .5,
                bottom: 0,
                child: DecoratedBox(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Color(0x1F4D6FDE),
                      blurRadius: 20,
                      offset: Offset(20, 20),
                    ),
                    BoxShadow(
                      color: Color(0x1F4D6FDE),
                      blurRadius: 20,
                      offset: Offset(-20, 20),
                    )
                  ]),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: AnimatedContainer(
                    width: cardWidth,
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
                    )),
              )
            ],
          ),
        ));
  }

  Widget _buildArtwork(String artwork) {
    return Container(
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
    );
  }

  Widget _buildMetaData() {
    return StreamBuilder<SequenceState>(
      stream: _player.sequenceStateStream,
      builder: (context, snapshot) {
        final state = snapshot.data;
        if (state?.sequence?.isEmpty ?? true) {
          return const SizedBox();
        } else {
          final metadata = state?.currentSource?.tag as AudioMetadata;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildArtwork(metadata.artwork),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  metadata.title,
                  style: textStyleTitle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  metadata.album,
                  style: textStyleAlbum,
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildPlayerContent() {
    double dd = (MediaQuery.of(context).size.height / 2) -
        (minCardHeight / 2 + artWorkDi / 2);
    return Positioned(
      top: dd,
      child: Column(
        children: [
          _buildMetaData(),
          SizedBox(height: defaultPadding * 2),
          MusicControls(player: _player),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        _buildGradientBackground(),
        _buildPlayerCard(),
        _buildPlayerContent(),
      ],
    ));
  }
}
