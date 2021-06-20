library dgq.globals;

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

GlobalKey<NavigatorState> appNavigator;
double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(BuildContext context) {
  final double _w = MediaQuery.of(context).size.width;
  if (!kIsWeb && Platform.isAndroid || !kIsWeb && Platform.isIOS) {
    return _w;
  } else {
    if (_w > 500) {
      return 500;
    } else {
      return _w;
    }
  }
}
