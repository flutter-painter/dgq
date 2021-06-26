import 'package:dgq/models/album.dart';
import 'package:dgq/views/songs.dart';
import 'package:flutter/material.dart';
import '../globals.dart' as globals;

class AlbumJacket extends StatelessWidget {
  final AlbumName albumName;
  const AlbumJacket(this.albumName, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, ctr) => InkWell(
        hoverColor: Colors.transparent,
        child: Column(
          children: [
            Container(
              // decoration:BoxDecoration(color: Colors.grey, shape: BoxShape.rectangle),
              child: Image.asset(
                "assets/${albumName.toCleanString()}.jpg",
                semanticLabel: '${albumName.toString()}',
                width: ctr.maxWidth,
                height: ctr.maxHeight * 0.7,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  albumName.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
        onTap: () => globals.appNavigator.currentState.push(MaterialPageRoute(
            builder: (context) => Songs(
                globals.screenWidth(context), globals.screenHeight(context),
                albumName: albumName))),
      ),
    );
  }
}
