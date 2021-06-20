import 'package:dgq/data/albums_data.dart';
import 'package:dgq/models/album.dart';
import 'package:dgq/widgets/app_bar.dart';
import 'package:dgq/theme/background.dart';
import 'package:just_audio/just_audio.dart';

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Songs extends StatefulWidget {
  final double _width;
  final double _height;
  final String albumName;
  Songs(this._width, this._height, {this.albumName});
  @override
  _SongsState createState() => _SongsState();
}

class _SongsState extends State<Songs> with TickerProviderStateMixin {
  Album album;

  AnimationController _controller;
  AnimationController _controller2;
  Animation<double> _animation;
  Animation<double> _animation2;
  AudioPlayer player;
  bool _isPaused;

  @override
  void initState() {
    super.initState();
    album = albums
        .firstWhere((element) => element.name.toString() == widget.albumName);

    _isPaused = true;
    player = AudioPlayer();
    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _isPaused
          ? const SizedBox()
          : FloatingActionButton(
              child: Icon(Icons.pause),
              onPressed: () async {
                // await player.stop();
                await player.pause();
                setState(() => _isPaused = true);
              },
            ),
      extendBodyBehindAppBar: true,
      appBar: appBar(widget._width),
      body: Stack(
        children: [
          BackgroundColor(),
          SizedBox(height: widget._height / 9.4),
          Scrollbar(
            child: ListView.builder(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemBuilder: (BuildContext context, int index) => songCard(
                  album.songs[index].title,
                  album.songs[index].duration,
                  album.name.toString(),
                  path: album.songs[index].path),
              itemCount: album.songs.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget songCard(String title, String subtitle, String albumName,
      {String path}) {
    return InkWell(
      onTap: () async {
        if (path != null && path.isNotEmpty) {
          HapticFeedback.lightImpact();
          try {
            var duration = await player.setAsset(path);
            await player.load();
            player.play();
          } catch (e) {}
          // await player.setAudioSource();
          setState(() {
            _isPaused = false;
          });
          //appNavigator.currentState
          //    .push(MaterialPageRoute(builder: (context) => route));
        }
      },
      child: Opacity(
        opacity: _animation.value,
        child: Transform.translate(
          offset: Offset(0, _animation2.value),
          child: Container(
            // width: widget._width * 0.8,
            // height: widget._height / 5.4,
            padding: EdgeInsets.fromLTRB(
                widget._width / 20, 0, widget._width / 20, widget._width / 20),
            child: Container(
              // width: widget._width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.2),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  border: Border.all(
                      color: Colors.white.withOpacity(.1), width: 1)),
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
                        // shape: BoxShape.rectangle,
                        color: Colors.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("assets/$albumName.jpg"),
                            fit: BoxFit.scaleDown),
                        //child: Image.asset(
                        //  "assets/$albumName.jpg",
                        // color: Colors.white,
                        // height: widget._height * 0.01,
                        // width: widget._width / 10,
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
                              fontSize: (widget._width + widget._height) / 44,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              wordSpacing: 1,
                            ),
                          ),
                          Text(
                            ' ' + subtitle,
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: (widget._width + widget._height) / 84,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
