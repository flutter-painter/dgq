import 'dart:async';
import 'package:dgq/app_bar.dart';
import 'package:just_audio/just_audio.dart';

import 'globales.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Tracks extends StatefulWidget {
  final double _width;
  final double _height;
  Tracks(this._width, this._height);
  @override
  _TracksState createState() => _TracksState();
}

class _TracksState extends State<Tracks> with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _controller2;
  Animation<double> _animation;
  Animation<double> _animation2;

  @override
  void initState() {
    super.initState();

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
      extendBodyBehindAppBar: true,
      appBar: appBar(widget._width),
      body: Stack(
        children: [
          BackgroundColor(),
          ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              SizedBox(height: widget._height / 9.4),
              card(
                'Sortie par gros temps',
                '03:14',
                Icons.music_note,
              ),
              card(
                'Nina',
                '06:34',
                Icons.music_note,
              ),
              card(
                'Quintaou Express',
                '06:05',
                Icons.music_note,
              ),
              card(
                'Ola bijou!',
                '05:36',
                Icons.music_note,
              ),
              card(
                'La grande roue',
                '03:35',
                Icons.music_note,
              ),
              card(
                'Txapela',
                '04:31',
                Icons.music_note,
              ),
              card(
                'Monsieur Ba Moussa',
                '04:15',
                Icons.music_note,
              ),
              card(
                'Angelus',
                '07:34',
                Icons.music_note,
              ),
              card(
                'Comme une prière',
                '04:46',
                Icons.music_note,
              ),
              card(
                'Il était une fois',
                '03:44',
                Icons.music_note,
              ),
              card(
                'Deconfinado',
                '03:49',
                Icons.music_note,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget card(String title, String subtitle, IconData icon, {String path}) {
    return Opacity(
      opacity: _animation.value,
      child: Transform.translate(
        offset: Offset(0, _animation2.value),
        child: Container(
          height: widget._height / 5.4,
          padding: EdgeInsets.fromLTRB(
              widget._width / 20, 0, widget._width / 20, widget._width / 20),
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () async {
              HapticFeedback.lightImpact();
              final player = AudioPlayer();
              var duration =
                  await player.setUrl('https://youtu.be/xdG3C-QMW8g');
              player
                  .play(); // Usually you don't want to wait for playback to finish.

              //appNavigator.currentState
              //    .push(MaterialPageRoute(builder: (context) => route));
            },
            child: Container(
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
                      height: widget._width / 3,
                      width: widget._width / 3,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: widget._width / 10,
                      ),
                    ),
                    SizedBox(width: widget._width / 40),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: widget._width / 1.84,
                          child: Text(
                            title,
                            maxLines: 3,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: widget._width / 17,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              wordSpacing: 1,
                            ),
                          ),
                        ),
                        Text(
                          subtitle,
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: widget._width / 30,
                          ),
                        ),
                      ],
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

class BackgroundColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            // Color(0xff146db6),
            Color(0xffE8B8E0),
            Color(0xffED92EF),
            Color(0xffc13808),
            Color(0xffa50811),
            Color(0xff750a12),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
    );
  }
}

class RouteWhereYouGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 50,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: Text(
          'EXAMPLE  PAGE',
        ),
      ),
    );
  }
}
