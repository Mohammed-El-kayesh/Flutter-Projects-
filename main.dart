import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'bloc_observer.dart';
import 'home_layout.dart';


void main()
{
  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget
{
  // constructor
  // build

  @override
  Widget build(BuildContext context)
  {

    Colors.white;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
    );
  }
}
