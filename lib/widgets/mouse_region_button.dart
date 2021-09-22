import 'package:flutter/material.dart';

class MouseRegionButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  const MouseRegionButton(this.text, {Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool hover = false;
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return MouseRegion(
        onHover: (event) => setState(() => hover = true),
        onExit: (event) => setState(() => hover = false),
        child: OutlineButton(
          onPressed: onPressed as void Function(),
          highlightedBorderColor: Colors.black,
          hoverColor: Colors.grey.shade400,
          // borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: hover ? Colors.white : Colors.black,
              letterSpacing: 1,
            ),
          ),
        ),
      );
    });
  }
}
