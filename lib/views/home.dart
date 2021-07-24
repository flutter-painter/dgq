// import 'package:animator/animator.dart';
// import 'package:dgq/songs.dart';
// import 'package:dgq/theme/background.dart';
import 'package:dgq/views/about.dart';
import 'package:dgq/widgets/album_jacket.dart';
import 'package:dgq/widgets/app_bar.dart';
import 'package:dgq/models/album.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dgq/globals.dart' as globals;

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    curve = CurvedAnimation(
        parent: controller, curve: Curves.fastLinearToSlowEaseIn);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final _width = globals.screenWidth(context);
    final _height = globals.screenHeight(context);
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.5),
      extendBodyBehindAppBar: true,
      appBar: appBar(context, true),
      body: Stack(
        children: [
          Center(
            child: FadeTransition(
              opacity: curve,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: _height / 8),
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AboutView())),
                    child: Container(
                      child: Image.asset('assets/band.jpg'),
                      margin: EdgeInsets.symmetric(
                          vertical: _height / 50, horizontal: _width / 50),
                      padding: EdgeInsets.symmetric(
                          vertical: _height / 50, horizontal: _width / 50),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.2),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              color: Colors.white.withOpacity(.3), width: 1)),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: _height * 0.01, horizontal: _width / 12),
                      child: Text(
                          'Nicolas Chelly, Philippe Nadeau, Idehiko Kan, Denis Gancel',
                          overflow: TextOverflow.ellipsis),
                    ),
                  )
                ],
              ),
            ),
          ),
          // TODO revoir les nommer
          // mettre l'année
          Positioned(
            right: _width * 0.1,
            left: _width * 0.1,
            bottom: _height * 0.04,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    width: _width / 5,
                    height: _height / 5,
                    child: AlbumJacket(AlbumName.BRIC_A_BRAC)),
                SizedBox(
                  width: _width / 5,
                  height: _height / 5,
                  child: AlbumJacket(AlbumName.MISCELLANEES),
                ),
                SizedBox(
                  width: _width / 5,
                  height: _height / 5,
                  child: AlbumJacket(AlbumName.PUZZLE),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
