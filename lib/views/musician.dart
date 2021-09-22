import 'package:dgq/globals.dart' as globals;
import 'package:dgq/models/musician.dart';
import 'package:dgq/style.dart';
import 'package:flutter/material.dart';

class MusicianView extends StatelessWidget {
  final Musician musician;
  const MusicianView(this.musician, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    return Scaffold(
      backgroundColor: Colors.white38,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                  musician.bio.isEmpty
                      ? const SliverToBoxAdapter()
                      : SliverToBoxAdapter(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  21.0, 21.0, 21.0, 0.0),
                              child: SizedBox(
                                height: globals.screenHeight(context) * .20,
                                child: Text(
                                  musician.bio,
                                  style: textStyleAlbumBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                  SliverPadding(
                    padding: const EdgeInsets.all(10),
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
