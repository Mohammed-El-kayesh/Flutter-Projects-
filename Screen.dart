import 'package:flutter/material.dart';
import 'package:untitled1/Cesar_Screen.dart';
import 'package:untitled1/Playfair_Screen.dart';

class NavigationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
          'Encryption'
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            RaisedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  CesarScreen()),
              );
            },
            child: Text('Caeser Cipher',
            style: TextStyle(color: Colors.white,fontSize: 20)
            ),
              color: Colors.teal,
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  PlayfairScreen()),
              );
            },color: Colors.indigo,
              child: Text('Playfair Cipher'
              ,style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),),
            ),
          ],
        ),
      ),
    );
  }
}
