// import 'package:animator/animator.dart';
// import 'package:dgq/songs.dart';
import 'package:dgq/theme/background.dart';
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
      floatingActionButton: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: AlbumJacket(AlbumName.BRIC_A_BRAC.toString(), _width)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21.0),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: AlbumJacket(AlbumName.MISCELLANEES.toString(), _width)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21.0),
            child: Align(
                alignment: Alignment.bottomRight,
                child: AlbumJacket(AlbumName.PUZZLE.toString(), _width)),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      extendBodyBehindAppBar: true,
      appBar: appBar(_width),
      body: Stack(
        children: [
          BackgroundMain(),
          Center(
            child: FadeTransition(
              opacity: curve,
              child: Container(
                child: Image.asset('assets/band.jpg'),
                margin: EdgeInsets.fromLTRB(
                    _width / 20, _width / 20, _width / 20, _width / 20),
                padding: EdgeInsets.fromLTRB(
                    _width / 50, _width / 50, _width / 50, _width / 50),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                        color: Colors.white.withOpacity(.3), width: 1)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
