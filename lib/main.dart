import 'package:dgq/views/home.dart';
import 'package:dgq/views/songs2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;

void main() {
  globals.appNavigator = GlobalKey<NavigatorState>();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: globals.appNavigator,
      theme: ThemeData(
          // primarySwatch: Colors.red,
          // applyElevationOverlayColor: false,
          //unselectedWidgetColor: Colors.black,
          // canvasColor: Colors.black,
          // colorScheme: ColorScheme.light(),
          // buttonColor: Colors.black,
          // primaryColor: Colors.black,
          // primaryColorLight: Colors.black,
          // accentColor: Colors.black,
          // indicatorColor: Colors.black,
          // hoverColor: Colors.black,
          ),
      home: Player(), //Home(),
    );
  }
}
