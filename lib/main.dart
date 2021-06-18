import 'package:dgq/app_bar.dart';
import 'package:dgq/tracks.dart';
import 'package:flutter/material.dart';
import 'globales.dart' as globals;

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
        primarySwatch: Colors.blue,
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

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final _width = globals.screenWidth(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(_width),
      body: Stack(
        children: [
          BackgroundColor(),
          Center(
            child: Container(
              child: Image.asset('assets/band.jpg'),
              padding: EdgeInsets.fromLTRB(
                  _width / 20, _width / 20, _width / 20, _width / 20),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.2),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  border: Border.all(
                      color: Colors.white.withOpacity(.1), width: 1)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(44.0),
              child: IconButton(
                  icon: Icon(
                    Icons.music_note,
                    color: Colors.white,
                    size: 44,
                    semanticLabel: 'listen',
                  ),
                  onPressed: () =>
                      globals.appNavigator.currentState.push(MaterialPageRoute(
                        builder: (context) =>
                            Tracks(_width, globals.screenHeight(context)),
                      ))),
            ),
          ),
        ],
      ),
    );
  }
}
