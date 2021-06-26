import 'package:dgq/models/album.dart';
import 'package:flutter/material.dart';

Widget backgroundSongs(BuildContext context, AlbumName albumName) {
  switch (albumName) {
    case AlbumName.BRIC_A_BRAC:
      return BackgroundColorMix().build(context);
      break;
    case AlbumName.MISCELLANEES:
      return BackgroundColorBlue().build(context);
      break;
    case AlbumName.PUZZLE:
      return BackgroundColorHot().build(context);
      break;
    default:
      return Container(decoration: BoxDecoration(color: Colors.black));
      break;
  }
}

class BackgroundColorHot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.amber,
            Color(0xffc13808),
            Color(0xffa50811),
            Color(0xff750a12),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
    );
  }
}

class BackgroundColorBlue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Colors.blue,
            Colors.blue[900],
          ],
        ),
      ),
    );
  }
}

class BackgroundColorMix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.orange[900]),
    );
  }
}
