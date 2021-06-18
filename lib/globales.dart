library dgq.globals;

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

GlobalKey<NavigatorState> appNavigator;
double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(BuildContext context) {
  if (!kIsWeb && Platform.isAndroid || !kIsWeb && Platform.isIOS) {
    return MediaQuery.of(context).size.width;
  } else {
    if (MediaQuery.of(context).size.width > 444) {
      return 424;
    } else if (MediaQuery.of(context).size.width > 300) {
      return 300;
    } else if (MediaQuery.of(context).size.width > 200) {
      return 200;
    } else {
      return 150;
    }
  }
}
