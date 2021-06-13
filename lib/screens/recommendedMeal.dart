import 'package:flutter/material.dart';

class RecommendedMealPlan extends StatelessWidget {
  final breakfast;
  final lunch;
  final dinner;
  final breakfastimg;
  final lunchimg;
  final dinnerimg;
  final calories;
  final protein;
  final carbs;
  final fats;
  RecommendedMealPlan(
      {this.breakfast,
      this.lunch,
      this.dinner,
      this.breakfastimg,
      this.lunchimg,
      this.dinnerimg,
      this.calories,
      this.carbs,
      this.fats,
      this.protein,
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar: AppBar(
        title: Text('Nutriary'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                 clipBehavior:Clip.antiAlias,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.fromLTRB(100, 10, 100, 5),
                      child: Text(" Breakfast - $breakfast",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
            ),
          ),
          Expanded(
                      child: Image(
              
              image: NetworkImage(breakfastimg),
              fit: BoxFit.fill,
              ),
          )

        ],
      ),
    ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                 clipBehavior:Clip.antiAlias,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.fromLTRB(100, 10, 100, 5),
                      child: Text(" Lunch - $lunch",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
            ),
          ),
          Expanded(
                      child: Image(
              
              image: NetworkImage(lunchimg,),
              fit: BoxFit.fill,
              ),
          )

        ],
      ),
    ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                 clipBehavior:Clip.antiAlias,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.fromLTRB(100, 10, 100, 5),
                      child: Text(" Dinner - $dinner",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
            ),
          ),
          Expanded(
                      child: Image(
              
              image: NetworkImage(dinnerimg),
              fit: BoxFit.fill,
              ),
          )

        ],
      ),
    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
               clipBehavior:Clip.antiAlias,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: Column(
                      children: [
                        Text(" Proteins:",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
          ),
          Text("$protein g",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
          ),
                      ],
                    ),
          ),
          Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: Column(
                      children: [
                        Text(" calories:" ,
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
          ),
          Text("$calories kcal" ,
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
          ),
                      ],
                    ),
          ),
          Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: Column(
                      children: [
                        Text(" carbs:",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
          ),
            Text("$carbs g",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
          ),
                      ],
                    ),
          ),
          Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: Column(
                      children: [
                        Text(" fats:",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
          ),
          Text("$fats g",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
          ),
                      ],
                    ),
          ),
          
        ],
      ),
    ),
          ),
          
        ],
      ),
    );
  }
}
