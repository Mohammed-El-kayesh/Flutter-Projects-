
import 'package:flutter/material.dart';
import 'package:untitled1/Playfair_Screen.dart';
import 'package:untitled1/Screen.dart';

import 'Cesar_Screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Security Project',

      home:NavigationScreen() ,
    );
  }
}

