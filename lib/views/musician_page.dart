import 'package:dgq/models/musician.dart';
import 'package:dgq/style.dart';
import 'package:flutter/material.dart';

class MusicianPage extends StatelessWidget {
  final Musician musician;
  const MusicianPage(this.musician, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  musician.firstName + ' ' + musician.lastName,
                  style: textStyleTitleBlack,
                ),
              ),
            ),
            Center(
              child: Hero(
                tag: musician.photoPath,
                child: Image.asset(
                  musician.photoPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  musician.bio,
                  style: textStyleAlbumBlack,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
