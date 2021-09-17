import 'package:dgq/models/musician.dart';
import 'package:dgq/style.dart';
import 'package:flutter/material.dart';
import 'package:dgq/globals.dart' as globals;

class MusicianWidget extends StatelessWidget {
  final Musician musician;
  const MusicianWidget(this.musician, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(musician.firstName + ' ' + musician.lastName),
                content: Text(musician.bio),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.exit_to_app),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              );
            });
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: globals.screenHeight(context) * 0.4,
            width: globals.screenWidth(context) * .8,
            child: Image.asset(
              musician.photoPath,
              fit: BoxFit.cover,
            ),
            margin: EdgeInsets.symmetric(
                vertical: globals.screenHeight(context) / 100,
                horizontal: globals.screenWidth(context) / 100),
            padding: EdgeInsets.symmetric(
                vertical: globals.screenHeight(context) / 100,
                horizontal: globals.screenWidth(context) / 100),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.2),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border:
                    Border.all(color: Colors.white.withOpacity(.3), width: 1)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: globals.screenHeight(context) / 30,
                horizontal: globals.screenWidth(context) / 20),
            child: RichText(
                text: TextSpan(style: textStyleAlbum, children: [
              TextSpan(
                text: musician.firstName + ' ' + musician.lastName,
              ),
              TextSpan(
                text: '\n' + musician.instrument,
              ),
              TextSpan(
                text: musician.isQuartet ? '\n' : '\nGuest Star',
              ),
            ])),
          ),
        ],
      ),
    );
  }
}
