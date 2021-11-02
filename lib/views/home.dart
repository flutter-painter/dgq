import 'dart:html';

import 'package:dgq/constants.dart';
import 'package:dgq/models/musician.dart';
import 'package:dgq/theme/style.dart';
import 'package:dgq/utils/launch_url.dart';
import 'package:dgq/views/player.dart';
import 'package:dgq/widgets/mouse_region_button.dart';
import 'package:dgq/widgets/musician.dart';
import 'package:flutter/material.dart';
import 'package:dgq/globals.dart' as globals;
import 'package:seo_renderer/renderers/link_renderer/link_renderer_web.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_web.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
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
                  title: TextRenderer(
                    element: TitleElement(),
                    text: Text(
                        globals.screenWidth(context) < 400
                            ? 'DGQ'
                            : 'Denis Gancel Quartet',
                        overflow: TextOverflow.fade,
                        style: textStyleTitle),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
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
                          LinkRenderer(
                            anchorText: 'Denis Gancel Quartet Spotify',
                            link: spotifyDGQ,
                            child: MouseRegionButton(
                              'spotify',
                              onPressed: () => launchInBrowser(spotifyDGQ),
                            ),
                          ),
                          LinkRenderer(
                            anchorText: 'Denis Gancel Quartet Youtube',
                            link: youtubeDGQ,
                            child: MouseRegionButton(
                              'youtube',
                              onPressed: () => launchInBrowser(youtubeDGQ),
                            ),
                          ),
                          LinkRenderer(
                            anchorText: 'Denis Gancel Quartet Facebook',
                            link: facebookDGQ,
                            child: MouseRegionButton(
                              'facebook',
                              onPressed: () => launchInBrowser(facebookDGQ),
                            ),
                          ),
                        ]),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(10),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: globals.screenWidth(context) / 8,
                      mainAxisSpacing: globals.screenHeight(context) / 20,
                      crossAxisCount:
                          globals.screenWidth(context) > 400 ? 3 : 2,
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
    );
  }
}
