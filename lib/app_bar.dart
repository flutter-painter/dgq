import 'package:dgq/globales.dart';
import 'package:dgq/tracks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget appBar(double width, {String title}) {
  return PreferredSize(
    preferredSize: Size(double.infinity, kToolbarHeight),
    child: ClipRRect(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      child: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white.withOpacity(.5),
        elevation: 0,
        title: Text(
          'Denis Gancel Quartet',
          style: TextStyle(
            fontSize: width / 17,
            color: Colors.black.withOpacity(.7),
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          // IconButton(
          //   tooltip: 'share',
          //   splashColor: Colors.transparent,
          //   highlightColor: Colors.transparent,
          //   icon: Icon(Icons.share, color: Colors.black.withOpacity(.7)),
          //   onPressed: () {
          //     HapticFeedback.lightImpact();
          //     appNavigator.currentState.push(
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return RouteWhereYouGo();
          //         },
          //       ),
          //     );
          //   },
          // ),
          // Text('  '),
        ],
      ),
    ),
  );
}
