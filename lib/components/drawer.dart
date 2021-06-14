import 'package:flutter/material.dart';

import '../helper/authenticate.dart';
import '../services/auth.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Color(0xFF47F000),
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 100,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.accessibility, size: 35,),
            title: Text('BMI calculator',style: TextStyle(fontSize: 20),),
            onTap: (){
              Navigator.pushNamed(context,'/bmiInput');
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 540, 0, 0),
            child: ListTile(
              leading: Icon(Icons.logout, size: 35,),
              title: Text('Deconexion',style: TextStyle(fontSize: 20),),
              onTap: (){
               AuthService().signOut();
        Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => Authenticate()));
              },
            ),
          )

        ],
      ),
    );
  }
}
