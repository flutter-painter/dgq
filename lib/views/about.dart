import 'package:dgq/models/musician.dart';
import 'package:dgq/style.dart';
import 'package:dgq/utils/launch_url.dart';
import 'package:dgq/views/songs2.dart';
import 'package:dgq/widgets/mouseregionbutton.dart';
import 'package:dgq/widgets/musician.dart';
import 'package:flutter/material.dart';
import 'package:dgq/globals.dart' as globals;

class AboutView extends StatefulWidget {
  AboutView({Key key}) : super(key: key);

  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CustomScrollView(
          controller: controller,
          slivers: <Widget>[
            SliverAppBar(
                expandedHeight: globals.screenHeight(context) * .15,
                // collapsedHeight: globals.screenHeight(context) * .1,
                floating: true,
                centerTitle: true,
                pinned: true,
                snap: true,
                stretch: true,
                automaticallyImplyLeading: false,
                // backgroundColor: Colors.black,
                flexibleSpace: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        child: Image.asset(
                      'assets/console.png',
                      fit: BoxFit.cover,
                    ))
                  ],
                ),
                title:
                    Text('Denis Gancel Quartet & Cie', style: textStyleTitle),
                actions: [
                  Center(
                    child: MouseRegionButton(
                      'spotify',
                      onPressed: () => launchInBrowser(
                          'https://open.spotify.com/artist/6s3HsM7KsqkGJAtqQ6yQUl'),
                    ),
                  ),
                ]),
            SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: globals.screenWidth(context) / 40,
                  mainAxisSpacing: globals.screenHeight(context) / 40,
                  crossAxisCount: 2,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) =>
                      MusicianWidget(musicians[index]),
                  childCount: musicians.length,
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 40,
            width: 40,
            child: IconButton(
              onPressed: () {
                globals.appNavigator.currentState.push(
                  MaterialPageRoute(
                    builder: (context) => Player(),
                  ),
                );
              },
              icon: Icon(Icons.music_note),
              color: Colors.black,
            ),
          ),
        )
      ],
    ));
  }
}
