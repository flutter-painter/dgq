import 'package:dgq/models/musician.dart';
import 'package:dgq/theme/style.dart';
import 'package:dgq/views/musician.dart';
import 'package:flutter/material.dart';
import 'package:dgq/globals.dart' as globals;

class MusicianWidget extends StatelessWidget {
  final Musician musician;
  const MusicianWidget(this.musician, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        globals.appNavigator.currentState?.push(
          MaterialPageRoute(builder: (context) => MusicianView(musician)),
        );
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: globals.screenHeight(context) * 0.4,
            width: globals.screenWidth(context) * .8,
            child: Hero(
              tag: musician.photoPath,
              child: Image.asset(
                musician.photoPath,
                fit: BoxFit.cover,
              ),
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
              border: Border.all(color: Colors.white.withOpacity(.3), width: 1),
            ),
          ),
          if (globals.screenWidth(context) > 400)
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 16),
                  child: RichText(
                    text: TextSpan(style: textStyleAlbum, children: [
                      TextSpan(
                        text: musician.firstName + ' ' + musician.lastName,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 22),
                      ),
                      TextSpan(
                        text: '\n' + musician.instrument,
                      ),
                      TextSpan(
                        text: musician.isQuartet ? '' : ' (Guest Star)',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 12),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
