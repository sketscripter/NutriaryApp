import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {

  final nutrient;
  final amount;
  final type;
  InfoCard({this.nutrient,this.amount,this.type});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5)
      ) ,
      elevation: 10,
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 70),
        child: Text('$nutrient = $amount $type',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
