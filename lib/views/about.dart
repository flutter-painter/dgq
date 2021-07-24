import 'package:dgq/models/musician.dart';
import 'package:dgq/widgets/app_bar.dart';
import 'package:dgq/widgets/musician.dart';
import 'package:flutter/material.dart';

class AboutView extends StatefulWidget {
  AboutView({Key key}) : super(key: key);

  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, false, isBackWhite: true),
      body: Scrollbar(
          child: SingleChildScrollView(
              child: Column(
        children: [
          for (final m in musicians) MusicianWidget(m),
        ],
      ))),
    );
  }
}
