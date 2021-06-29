import 'package:dgq/models/musician.dart';
import 'package:flutter/material.dart';

class MusicianWidget extends StatelessWidget {
  final Musician musician;
  const MusicianWidget(this.musician, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Container(
        width: _width,
        margin: EdgeInsets.symmetric(
            vertical: _height * 0.01, horizontal: _width * 0.03),
        child: Row(
          children: [
            Container(
              width: _width / 2,
              child: Image.asset('assets/band.jpg'),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                          text: musician.firstName + ' ' + musician.lastName,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: '\n' + musician.instrument),
                      TextSpan(text: '\n' + musician.bio),
                    ])),
              ),
            ),
          ],
        ));
  }
}
