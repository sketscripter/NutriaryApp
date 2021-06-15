import 'package:chatapp/helper/authenticate.dart';
import 'package:chatapp/helper/helperfunctions.dart';
import 'package:chatapp/screens/dashboard.dart';
import 'package:chatapp/screens/input_page.dart';
import 'package:chatapp/screens/loginPage.dart';
import 'package:chatapp/screens/mealPlanner.dart';
import 'package:chatapp/screens/registrationPage.dart';
import 'package:chatapp/screens/splash.dart';
import 'package:chatapp/screens/welcomeScreen.dart';
import 'package:chatapp/views/chatrooms.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userIsLoggedIn;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF47F000),
        scaffoldBackgroundColor: Color(0xff1F1F1F),
        accentColor: Color(0xFFB6FF00),
        fontFamily: "OverpassRegular",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: userIsLoggedIn != null ?  userIsLoggedIn ? ChatRoom() : Authenticate()
      //     : Container(
      //   child: Center(
      //     child: Authenticate(),
      //   ),
      // ),
      routes: {
        '/': (context) => MealPlanner(),
        '/register': (context) => RegistrationPage(),
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => Dashboard(),
        '/bmiInput': (context) => InputPage(),
      },
    );
  }
}
