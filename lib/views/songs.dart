import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:dgq/data/albums_data.dart';
import 'package:dgq/models/album.dart';
import 'package:dgq/widgets/app_bar.dart';
import 'package:dgq/theme/background.dart';
// import 'package:just_audio/just_audio.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Songs extends StatefulWidget {
  final double _width;
  final double _height;
  final AlbumName albumName;
  Songs(this._width, this._height, {this.albumName});
  @override
  _SongsState createState() => _SongsState();
}

class _SongsState extends State<Songs> with TickerProviderStateMixin {
  AssetsAudioPlayer assetsAudioPlayer;
  Album album;
  AnimationController _controller;
  AnimationController _controller2;
  Animation<double> _animation;
  Animation<double> _animation2;

  @override
  void initState() {
    super.initState();
    assetsAudioPlayer = AssetsAudioPlayer();
    album = albums.firstWhere(
        (element) => element.name.toString() == widget.albumName.toString());

    _controller2 =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
          ..addListener(() {
            setState(() {});
          });

    _animation2 = Tween<double>(begin: 0, end: -50).animate(CurvedAnimation(
        parent: _controller2, curve: Curves.fastLinearToSlowEaseIn));

    _controller.forward();
    _controller2.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(context, false, isBackWhite: false),
      body: Stack(
        children: [
          backgroundSongs(context, widget.albumName),
          Scrollbar(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: widget._height / 6),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemBuilder: (BuildContext context, int index) => songCard(
                  album.songs[index].title,
                  album.songs[index].duration,
                  album.name,
                  path: album.songs[index].path),
              itemCount: album.songs.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget songCard(String title, String subtitle, AlbumName albumName,
      {String path}) {
    return Opacity(
      opacity: _animation.value,
      child: Transform.translate(
        offset: Offset(0, _animation2.value),
        child: Container(
          padding: EdgeInsets.fromLTRB(
              widget._width / 20, 0, widget._width / 20, widget._width / 20),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.2),
                borderRadius: BorderRadius.all(Radius.circular(30)),
                border:
                    Border.all(color: Colors.white.withOpacity(.1), width: 1)),
            child: Padding(
              padding: EdgeInsets.all(widget._width / 50),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: widget._height / 10,
                    width: widget._width / 6.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/${albumName.toCleanString()}.jpg'),
                          fit: BoxFit.scaleDown),
                    ),
                  ),
                  SizedBox(width: widget._width / 40),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 3,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: (widget._width + widget._height) / 51,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            wordSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Text(
                            subtitle,
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: (widget._width + widget._height) / 84,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  path == null || path.isEmpty
                      ? const SizedBox()
                      : StreamBuilder(
                          stream: assetsAudioPlayer.isPlaying,
                          builder: (context, snap) {
                            return !snap.data
                                ? IconButton(
                                    tooltip: 'play',
                                    hoverColor: Colors.white,
                                    iconSize: 55,
                                    padding: EdgeInsets.all(22),
                                    icon: Icon(Icons.play_circle_fill,
                                        color: Colors.white),
                                    onPressed: () async {
                                      if (path != null && path.isNotEmpty) {
                                        HapticFeedback.lightImpact();
                                        try {
                                          assetsAudioPlayer
                                              .open(Audio('$path'));
                                        } catch (e) {
                                          print(e);
                                        }
                                      }
                                    },
                                  )
                                : IconButton(
                                    tooltip: 'pause',
                                    hoverColor: Colors.white,
                                    iconSize: 33,
                                    padding: EdgeInsets.all(22),
                                    icon: Icon(Icons.pause_circle_filled,
                                        color: Colors.white),
                                    onPressed: () async {
                                      HapticFeedback.lightImpact();
                                      try {
                                        assetsAudioPlayer.pause();
                                      } catch (e) {
                                        print(e);
                                      }
                                    },
                                  );
                          }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
