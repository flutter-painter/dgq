import 'package:dgq/views/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'package:seo_renderer/seo_renderer.dart';

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
      navigatorObservers: [routeObserver],
      theme: ThemeData(backgroundColor: Colors.white70),
      home: HomeView(),
    );
  }
}
