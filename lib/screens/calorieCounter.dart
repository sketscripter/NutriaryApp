import 'package:flutter/material.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/services.dart';

import '../components/card.dart';
import '../foodApiNetworking.dart';

String _apiKey = '3af7176e2eee4afda368dc553f5a47df';
String _url = 'https://api.spoonacular.com/food/ingredients/search?apiKey=';
String _url2 = 'https://api.spoonacular.com/food/ingredients/';

// https://api.spoonacular.com/recipes/complexSearch?apiKey=52fae7b0abb444a6b6afbaa1ab84e5b6&query=pasta&minFat=25&minCalories=50&minCarbs=10&minSugar=0&number=1
//https://api.spoonacular.com/food/ingredients/search?apiKey=3af7176e2eee4afda368dc553f5a47df&query=banana&number=1

class CalorieCounter extends StatefulWidget {
  @override
  _CalorieCounterState createState() => _CalorieCounterState();
}

class _CalorieCounterState extends State<CalorieCounter> {
  var carbs = 0.0;
  var calories = 0.0;
  var fat = 0.0;
  var sugar = 0.0;

  void getData(String query, String amount) async {
    NetworkHelper networkHelper =
        NetworkHelper(url: _url + _apiKey + '&query=' + query);
    var response = await networkHelper.getData();
    NetworkHelper networkHelper2 = NetworkHelper(
        url: _url2 +
            response["results"][0]["id"].toString() +
            '/information?apiKey=' +
            _apiKey +
            '&amount=' +
            amount +
            '&unit=grams');
    var response2 = await networkHelper2.getData();
    setState(() {
      calories = response2["nutrition"]["nutrients"][8]["amount"];
      fat = response2["nutrition"]["nutrients"][7]["amount"];
      carbs = response2["nutrition"]["nutrients"][13]["amount"];
      sugar = response2["nutrition"]["nutrients"][16]["amount"];
      _showSpinner = false;
    });
  }

  String food;
  String amount;
  bool _showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF47F000),
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                        trailing: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            setState(() {
                              if (amount == null) {
                                amount = '0';
                              }
                              _showSpinner = true;
                            });
                            getData(food, amount);
                          },
                        ),
                        title: TextField(
                          decoration: InputDecoration(
                              hintText: 'Enter food name',
                              filled: true,
                              fillColor: Colors.white,
                              icon: Icon(
                                Icons.fastfood,
                                color: Colors.grey[700],
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide.none)),
                          onChanged: (value) {
                            food = value;
                          },
                        ),
                        subtitle: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Enter amount in grams',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide.none)),
                          onChanged: (value) {
                            amount = value;
                          },
                        )),
                  ),
                ),
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    InfoCard(
                      nutrient: "Calories",
                      amount: calories,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InfoCard(
                      nutrient: "Carbs",
                      amount: carbs,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InfoCard(
                      nutrient: "Sugar",
                      amount: sugar,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InfoCard(
                      nutrient: "Fat",
                      amount: fat,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
