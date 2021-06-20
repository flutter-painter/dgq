import 'package:dgq/views/songs.dart';
import 'package:flutter/material.dart';
import '../globals.dart' as globals;

class AlbumJacket extends StatelessWidget {
  final double width;
  final String name;
  const AlbumJacket(this.name, this.width, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          width: width / 4,
          child: Image.asset(
            "assets/$name.jpg",
            semanticLabel: '$name',
          )),
      onTap: () => globals.appNavigator.currentState.push(MaterialPageRoute(
          builder: (context) => Songs(
              globals.screenWidth(context), globals.screenHeight(context),
              albumName: name))),
    );
  }
}
