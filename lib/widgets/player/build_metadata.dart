import 'package:dgq/utils/launch_url.dart';
import 'package:dgq/theme/style.dart';
import 'package:dgq/models/audio_metadata.dart';
import 'package:dgq/widgets/artwork.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class BuildMetadata extends StatelessWidget {
  final AudioPlayer player;
  const BuildMetadata(this.player, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SequenceState?>(
      stream: player.sequenceStateStream,
      builder: (context, snapshot) {
        final state = snapshot.data;
        if (state?.sequence.isEmpty ?? true) {
          return const SizedBox();
        } else {
          final metadata = state!.currentSource!.tag as AudioMetadata;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => launchInBrowser(metadata.albumUrl),
                child: ArtworkWidget(metadata.artwork),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 600),
                  switchInCurve: Curves.bounceIn,
                  child: Text(
                    metadata.title,
                    key: Key(metadata.title),
                    style: textStyleTitle,
                  ),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: FadeTransition(opacity: animation, child: child),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 600),
                  switchInCurve: Curves.bounceIn,
                  child: Text(
                    metadata.album,
                    style: textStyleAlbum,
                    key: Key(metadata.album),
                  ),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: FadeTransition(opacity: animation, child: child),
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
