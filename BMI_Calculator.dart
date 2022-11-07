import 'dart:math';

import 'package:counter/BMI_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  Color color = Colors.grey;
  bool isMale = true;
  double height=120;
  int weight=50;
  int age=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        shadowColor:Colors.blueGrey ,
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.w800,
            fontSize: 25.0,
          ),
        ),
      ),
      body: Container(
        color: Colors.black87,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('Assets/images/male.png'),
                                height: 90.0,
                                width: 90.0,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                'MALE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(15.0),
                            color: isMale ? Colors.greenAccent : Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('Assets/images/female.png'),
                                height: 90.0,
                                width: 90.0,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                'FEMALE',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(15.0),
                            color: !isMale ? Colors.purple : Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(25.0),
                    color: Colors.black87,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        'HEIGHT',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.0,
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${height.round()}',
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            'cm',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                          value: height,
                          thumbColor: Colors.green,
                          activeColor: Colors.green,
                          min: 80.0,
                          max: 220.0,
                          onChanged: (value) {
                            setState(() {
                              height=value;
                            });
                            print(value.round());
                          }),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(25.0),
                          color: Colors.black87,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0,
                                color: Colors.teal
                              ),
                            ),
                            Text(
                              '${age}',
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 40.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  heroTag: 'age--',
                                  mini: true,
                                  child: Icon(Icons.remove),
                                  backgroundColor: Colors.blueGrey,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  heroTag: 'age++',
                                  mini: true,
                                  child: Icon(Icons.add),
                                  backgroundColor: Colors.green,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(25.0),
                          color: Colors.black87,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0,
                                color: Colors.teal,
                              ),
                            ),
                            Text(
                              '${weight}',
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.teal,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },

                                  heroTag: 'weight--',
                                  mini: true,
                                  child: Icon(Icons.remove),
                                  backgroundColor: Colors.blueGrey,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                 setState(() {
                                   weight++;
                                 });
                                  },
                                  heroTag: 'weight++',
                                  mini: true,
                                  child: Icon(Icons.add),
                                  backgroundColor: Colors.green,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.black87,
              child: MaterialButton(
                onPressed: () {
                  double result=weight/pow(height/100,2);
                  print(result.round());
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=>BMIResult(
                            isMale: isMale,
                            age: age,
                            result: result.round(),
                          ),
                      ));
                },
                height: 50.0,
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    color: Colors.greenAccent,

                    fontSize: 25.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
