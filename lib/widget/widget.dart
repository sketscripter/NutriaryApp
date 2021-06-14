import 'package:flutter/material.dart';

import '../helper/authenticate.dart';
import '../services/auth.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.logout,
        color: Colors.black,
      ),
      onPressed: () {
       AuthService().signOut();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Authenticate()));
      },
    )
  ],
    title: Image.asset(
      "assets/images/logo.png",
      height: 40,
    ),
    elevation: 0.0,
    centerTitle: false,
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white54),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)));
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 16);
}

TextStyle biggerTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 17);
}
