
import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {
final int result;
final bool isMale;
final int age;
BMIResult(
{
 required this.result,
  required this.age,
  required this.isMale,
}
    );
String status(){
if(result<18.5)
  return"Under weight";
else if(result>18.5&&result<24.9)
  return"Normal weight";
else if(result>25&&result<29.9)
  return"Overweight";
else if(result>30&&result<34.9)
  return"Obesity class |";
else if(result>35&&result<37.9)
  return"Obesity class ||";
else return"Obesity class |||";



}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: Text(
          'BMI Result', style: TextStyle(
          color: Colors.teal,
          fontWeight: FontWeight.w800,
          fontSize: 25.0,
        ),
        ),
      ),
      body: Container(
        color: Colors.black54,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Gender:${isMale?"Male":"Female"}',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),),

              Text('Age:$age',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),),
              Text('Result:$result',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),),
              SizedBox(
                height: 20.0,
              ),
              Text('Status:${status()}',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),),




      ],
    ),



          ),

      ),

    );
  }
}
