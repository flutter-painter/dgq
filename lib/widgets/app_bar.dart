// import 'package:dgq/globals.dart';
// import 'package:dgq/views/songs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget appBar(BuildContext context, bool isHome,
    {bool isBackWhite, String title}) {
  return PreferredSize(
    preferredSize: Size(double.infinity, kToolbarHeight),
    child: ClipRRect(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: isHome
            ? const SizedBox()
            : IconButton(
                icon: Icon(Icons.arrow_back_ios,
                    color: isBackWhite ? Colors.black : Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
        brightness: Brightness.light,
        backgroundColor: Colors.white.withOpacity(.15),
        elevation: 0,
        title: Text(
          'Denis Gancel Quartet',
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 33,
              color: isBackWhite ? Colors.black.withOpacity(.7) : Colors.white,
              fontWeight: FontWeight.w400,
              fontFamily: 'PT-Sans'),
        ),
        actions: [],
      ),
    ),
  );
}
