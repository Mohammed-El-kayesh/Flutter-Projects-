import 'package:flutter/material.dart';
import 'package:untitled1/AutoKeyScreen.dart';
import 'package:untitled1/Cesar_Screen.dart';
import 'package:untitled1/Playfair_Screen.dart';
import 'package:untitled1/VigenerScreen.dart';

class NavigationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( centerTitle: true,
        title:Text(
          'Ciphers Menu',style: TextStyle(

          color: Colors.cyan,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),

        ),

        backgroundColor: Colors.black,
        actionsIconTheme: IconThemeData.fallback(),
        shadowColor: Colors.teal,
      ),
      body:
      Stack(
        children: [Container(
          color: Colors.blueGrey,
          child: Center(

            child: Column(


              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                SizedBox(
                  height: 45,
                  width: 200,
                  child: RaisedButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  CesarScreen()),
                    );
                  },
                  child: Text('Caeser Cipher',
                  style: TextStyle(color: Colors.teal,fontSize: 24,fontWeight: FontWeight.bold)
                  ),
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 45,
                  width: 200,
                  child: RaisedButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  PlayfairScreen()),
                    );
                  },color: Colors.black87,
                    child: Text('Playfair Cipher'
                    ,style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.teal,
                        fontSize: 24
                      ),),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 45,
                  width: 200,
                  child: RaisedButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  AutoKeyScreen()),
                    );
                  },color: Colors.black87,
                    child: Text('AutoKey Cipher'
                      ,style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          fontSize: 24
                      ),),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 45,
                  width: 200,
                  child: RaisedButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  VigenereScreen()),
                    );
                  },color: Colors.black87,
                    child: Text('Vigener Cipher'
                      ,style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          fontSize: 24
                      ),),

                  ),

                ),

              ],


            ),


          ),

        ),
          Container(
              alignment: Alignment.bottomCenter,
              child: Text('By: Mohamed Elkayesh',style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold
              ),))
      ],
      ),

    );

  }
}
