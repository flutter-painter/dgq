import 'package:dgq/data/audio.dart';
import 'package:dgq/theme/background.dart';
import 'package:flutter/material.dart';
import 'package:dgq/globals.dart' as globals;
import '../../constants.dart';

class PlayerCard extends StatelessWidget {
  final int currentIndex;
  const PlayerCard(this.currentIndex, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: globals.screenHeight(context) * .5,
      child: FractionalTranslation(
        translation: Offset(0, -.5),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: AnimatedContainer(
                width: maxCardHeight,
                height: minCardHeight, // ? minCardHeight
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: background.evaluate(
                    AlwaysStoppedAnimation(currentIndex / audioSource.length),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
