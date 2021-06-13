import 'package:chatapp/views/chatrooms.dart';
import 'package:chatapp/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/screens/mealPlanner.dart';
import 'package:chatapp/screens/chatbot.dart';
import 'package:chatapp/screens/calorieCounter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:chatapp/components/drawer.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int pageNumber = 1;
  List<Widget> pages=[
    MealPlanner(),
    ChatRoom(),
    CalorieCounter(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF47F000),
        drawer: MainDrawer(),
        bottomNavigationBar: CurvedNavigationBar(
          index: pageNumber,
          animationDuration: Duration(milliseconds: 250 ),
          height: 50,
          backgroundColor: Color(0xFF47F000),
          color: Colors.white,
          items: <Widget>[
            Icon(Icons.fastfood),
            Icon(Icons.adb),
            Icon(Icons.add_to_queue),
          ],
          onTap: (index){
            setState(() {
              pageNumber = index;
            });
          },
        ),
        body: pages[pageNumber]
    );
  }
}
