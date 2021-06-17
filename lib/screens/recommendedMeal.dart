import 'package:chatapp/recipe/RecipeDetails.dart';
import 'package:flutter/material.dart';

import 'loginPage.dart';

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
  final bingredients;
  final btitle;
  final bsource;
  final bscore;
  final btime;
  final bserve;
  final bsummary;
  final lingredients;
  final ltitle;
  final lsource;
  final lscore;
  final ltime;
  final lserve;
  final lsummary;
  final dingredients;
  final dtitle;
  final dsource;
  final dscore;
  final dtime;
  final dserve;
  final dsummary;

  RecommendedMealPlan({
    this.breakfast,
    this.lunch,
    this.dinner,
    this.breakfastimg,
    this.lunchimg,
    this.dinnerimg,
    this.calories,
    this.carbs,
    this.fats,
    this.protein,
    this.bingredients,
    this.btitle,
    this.bsource,
    this.bscore,
    this.btime,
    this.bserve,
    this.bsummary,
    this.lingredients,
    this.ltitle,
    this.lsource,
    this.lscore,
    this.ltime,
    this.lserve,
    this.lsummary,
    this.dingredients,
    this.dtitle,
    this.dsource,
    this.dscore,
    this.dtime,
    this.dserve,
    this.dsummary,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF47F000),
      appBar: AppBar(
        title: Text('Nutriary'),
        centerTitle: true,
        backgroundColor: Color(0xFF47F000),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: FlatButton(
                  onPressed: () {
                    
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetails(
                            bingredientlist: bingredients,
                            btitle: btitle,
                            bsource: bsource,
                            bscore: bscore,
                            btime: btime,
                            bserve: bserve,
                            breakfastimg: breakfastimg,
                            bsummary: bsummary,
                          ),
                        ));
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(100, 10, 100, 5),
                        child: Text(
                          " Breakfast - $breakfast",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Image(
                          image: NetworkImage(
                            breakfastimg,
                          ),
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: FlatButton(
                  onPressed: () {
                    
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetails(
                            bingredientlist: lingredients,
                            btitle: ltitle,
                            bsource: lsource,
                            bscore: lscore,
                            btime: ltime,
                            bserve: lserve,
                            breakfastimg: lunchimg,
                            bsummary: lsummary,
                          ),
                        ));
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(100, 10, 100, 5),
                        child: Text(
                          " Lunch - $lunch",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Image(
                          image: NetworkImage(
                            lunchimg,
                          ),
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: FlatButton(
                  onPressed: () {
                    
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetails(
                            bingredientlist: dingredients,
                            btitle: dtitle,
                            bsource: dsource,
                            bscore: dscore,
                            btime: dtime,
                            bserve: dserve,
                            breakfastimg: dinnerimg,
                            bsummary: dsummary,
                          ),
                        ));
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(100, 10, 100, 5),
                        child: Text(
                          " Dinner - $dinner",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Image(
                          image: NetworkImage(
                            dinnerimg,
                          ),
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: Column(
                      children: [
                        Text(
                          " Proteins:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$protein g",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: Column(
                      children: [
                        Text(
                          " calories:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$calories kcal",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: Column(
                      children: [
                        Text(
                          " carbs:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$carbs g",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: Column(
                      children: [
                        Text(
                          " fats:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$fats g",
                          style: TextStyle(fontWeight: FontWeight.bold),
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
