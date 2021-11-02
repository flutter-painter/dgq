import 'package:dgq/widgets/player/build_metadata.dart';
import 'package:flutter/material.dart';
import 'package:dgq/globals.dart' as globals;
import 'package:dgq/constants.dart';
import 'package:dgq/widgets/music_controls.dart';
import 'package:just_audio/just_audio.dart';

class PlayerContent extends StatelessWidget {
  final AudioPlayer player;
  const PlayerContent(this.player, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: (globals.screenHeight(context) / 2) -
          (minCardHeight / 2 + artWorkDi / 2),
      width: maxCardHeight - (defaultPadding * 3),
      child: Column(
        children: [
          BuildMetadata(player),
          SizedBox(height: defaultPadding),
          MusicControls(player: player),
        ],
      ),
    );
  }
}
