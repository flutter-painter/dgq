import 'package:dgq/models/musician.dart';
import 'package:dgq/style.dart';
import 'package:dgq/utils/launch_url.dart';
import 'package:dgq/views/songs2.dart';
import 'package:dgq/widgets/mouseregionbutton.dart';
import 'package:dgq/widgets/musician.dart';
import 'package:flutter/material.dart';
import 'package:dgq/globals.dart' as globals;

class AboutView extends StatefulWidget {
  AboutView({Key? key}) : super(key: key);

  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: globals.screenHeight(context),
            child: CustomScrollView(
              shrinkWrap: false,
              controller: controller,
              slivers: <Widget>[
                SliverAppBar(
                  // collapsedHeight: globals.screenHeight(context) * .12,
                  expandedHeight: globals.screenHeight(context) * .4,
                  centerTitle: true,
                  pinned: true,
                  //floating: true,
                  //stretch: true,
                  //snap: true,
                  backgroundColor: Colors.black,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Image.asset(
                          'assets/band.png',
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                  title: Text(
                      globals.screenWidth(context) < 400
                          ? 'DGQ'
                          : 'Denis Gancel Quartet',
                      overflow: TextOverflow.fade,
                      style: textStyleTitle),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: globals.screenHeight(context) * .80,
                    child: PlayerView(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MouseRegionButton(
                            'spotify',
                            onPressed: () => launchInBrowser(
                                'https://open.spotify.com/artist/6s3HsM7KsqkGJAtqQ6yQUl'),
                          ),
                          MouseRegionButton(
                            'youtube',
                            onPressed: () => launchInBrowser(
                                'https://www.youtube.com/user/denisgancel'),
                          ),
                          MouseRegionButton(
                            'facebook',
                            onPressed: () => launchInBrowser(
                                'https://www.facebook.com/denisgancelquartetcie/'),
                          ),
                        ]),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(10),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: globals.screenWidth(context) / 10,
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
          ),
        ],
      ),
      // Align(
      //   alignment: Alignment.bottomCenter,
      //   child: SizedBox(
      //     height: 40,
      //     width: 40,
      //     child: IconButton(
      //       onPressed: () {
      //         globals.appNavigator.currentState.push(
      //           MaterialPageRoute(
      //             builder: (context) => Player(),
      //           ),
      //         );
      //       },
      //       icon: Icon(Icons.music_note),
      //       color: Colors.black,
      //     ),
      //   ),
      // )
      //],
      //)
    );
  }
}
