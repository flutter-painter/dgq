import 'dart:html';

import 'package:dgq/globals.dart' as globals;
import 'package:dgq/models/musician.dart';
import 'package:dgq/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/image_renderer/image_renderer_web.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_web.dart';

class MusicianView extends StatelessWidget {
  final Musician musician;
  const MusicianView(this.musician, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: globals.screenHeight(context),
              child: CustomScrollView(
                shrinkWrap: false,
                controller: controller,
                slivers: <Widget>[
                  SliverAppBar(
                    centerTitle: true,
                    pinned: true,
                    leading: IconButton(
                      icon: Icon(Icons.close, color: Colors.black),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    backgroundColor: Colors.white70,
                    automaticallyImplyLeading: false,
                    title: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          musician.firstName + ' ' + musician.lastName,
                          style: textStyleTitleBlack,
                        ),
                      ),
                    ),
                  ),
                  if (musician.bio.isNotEmpty)
                    SliverToBoxAdapter(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                            globals.screenWidth(context) * 0.3,
                            globals.screenHeight(context) * .1,
                            globals.screenWidth(context) * 0.3,
                            globals.screenHeight(context) * .05,
                          ),
                          child: TextRenderer(
                            element: ParagraphElement(),
                            text: Text(musician.bio,
                                style: textStyleAlbumBlack,
                                overflow: TextOverflow.visible),
                          ),
                        ),
                      ),
                    ),
                  SliverPadding(
                    padding: const EdgeInsets.all(40),
                    sliver: SliverFillRemaining(
                      child: Center(
                        child: Hero(
                          tag: musician.photoPath,
                          child: Image.asset(
                            musician.photoPath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
