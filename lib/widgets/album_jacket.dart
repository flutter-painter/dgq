import 'package:dgq/views/songs.dart';
import 'package:flutter/material.dart';
import '../globals.dart' as globals;

class AlbumJacket extends StatelessWidget {
  final String name;
  const AlbumJacket(this.name, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, ctr) => InkWell(
        child: Column(
          children: [
            Expanded(
              child: Image.asset("assets/$name.jpg",
                  semanticLabel: '$name', width: ctr.maxWidth),
            ),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        onTap: () => globals.appNavigator.currentState.push(MaterialPageRoute(
            builder: (context) => Songs(
                globals.screenWidth(context), globals.screenHeight(context),
                albumName: name))),
      ),
    );
  }
}
