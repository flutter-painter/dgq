import 'package:animator/animator.dart';
import 'package:dgq/app_bar.dart';
import 'package:dgq/tracks.dart';
import 'package:flutter/material.dart';
import 'globales.dart' as globals;
import 'background.dart';

void main() {
  globals.appNavigator = GlobalKey<NavigatorState>();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: globals.appNavigator,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Home(),
    );
  }
}

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
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () => globals.appNavigator.currentState.push(MaterialPageRoute(
            builder: (context) =>
                Tracks(_width, globals.screenHeight(context)))),
        child: Container(
          height: _width / 4.7,
          width: _width / 4.7,
          child: Animator<double>(
            duration: Duration(seconds: 4),
            cycles: 0,
            curve: Curves.easeInOut,
            tween: Tween<double>(begin: 15.0, end: 20.0),
            builder: (context, animatorState, child) => Icon(
              Icons.audiotrack,
              size: animatorState.value * 2,
              color: Colors.white,
            ),
          ),
        ),
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
