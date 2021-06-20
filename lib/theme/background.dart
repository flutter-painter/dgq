import 'package:flutter/material.dart';

class BackgroundColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            // Color(0xff146db6),
            // Color(0xffE8B8E0),
            // Color(0xffED92EF),
            Colors.amber,
            Color(0xffc13808),
            Color(0xffa50811),
            Color(0xff750a12),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
    );
  }
}

class BackgroundMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.amber,
            // Color(0xff146db6),
            // Color(0xffE8B8E0),
            Color(0xffc13808),
            Color(0xffa50811),
            Color(0xff750a12),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
