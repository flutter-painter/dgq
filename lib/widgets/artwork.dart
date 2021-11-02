import 'package:dgq/constants.dart';
import 'package:flutter/material.dart';

class ArtworkWidget extends StatelessWidget {
  final String artwork;
  const ArtworkWidget(this.artwork, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return artwork.isEmpty
        ? const SizedBox()
        : AnimatedSwitcher(
            duration: Duration(seconds: 1),
            child: Container(
              key: Key(artwork),
              width: artWorkDi,
              height: artWorkDi,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(artwork)),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x142196F3),
                      offset: Offset(0, 40),
                      blurRadius: 40,
                    ),
                  ]),
            ),
            transitionBuilder: (child, animation) {
              return RotationTransition(
                turns: animation,
                alignment: Alignment.center,
                child: FadeTransition(opacity: animation, child: child),
              );
            },
          );
  }
}
