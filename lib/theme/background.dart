import 'package:flutter/material.dart';

class LinearGradientTween extends Tween<LinearGradient> {
  LinearGradientTween({LinearGradient begin, LinearGradient end})
      : super(begin: begin, end: end);
  @override
  LinearGradient lerp(double t) => LinearGradient.lerp(begin, end, t);
}

class RadialGradientTween extends Tween<RadialGradient> {
  RadialGradientTween() : super();
}

final Animatable<LinearGradient> background = TweenSequence<LinearGradient>([
  TweenSequenceItem(
      tween: LinearGradientTween(
          begin: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Colors.blue[300], Colors.blue[900]],
          ),
          end: linear1),
      weight: 1.0),
  TweenSequenceItem(
      tween: LinearGradientTween(
        begin: linear1,
        end: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Colors.orange, Colors.orange[200]],
        ),
      ),
      weight: 1.0),
  TweenSequenceItem(
      tween: LinearGradientTween(
          begin: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Colors.orange[300], Colors.orange[600]],
          ),
          end: linear1),
      weight: 1.0),
]);

const linear1 = LinearGradient(
  colors: [
    Colors.amber,
    Color(0xffc13808),
    Color(0xffa50811),
    Color(0xff750a12),
  ],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
);
final linear2 = LinearGradient(
  colors: [
    Colors.orange,
    Colors.orange[900],
  ],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
);
