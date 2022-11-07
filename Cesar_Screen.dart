import 'package:flutter/material.dart';

class CesarScreen extends StatefulWidget {



  @override
  State<CesarScreen> createState() => _CesarScreenState();
}

class _CesarScreenState extends State<CesarScreen> {
  TextEditingController txt_controller = TextEditingController();
  TextEditingController key_controller = TextEditingController();
  String result = "";
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Caesar Cipher',),
        backgroundColor: Colors.blueGrey,

      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Plain Text",
                    ),
                    controller: txt_controller,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Key",

                    ),
                    controller: key_controller,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RaisedButton(onPressed:(){
                        this.process(true);},
                        child: Text("Encrypt"),
                        color: Colors.blue,),

                      RaisedButton(onPressed:(){
                       this.process(false);},
                        child: Text("Decrypt"),
                       color: Colors.green,),


                      RaisedButton(
                        onPressed:(){
                          delete();},
                        child: Text("Delete"),
                        color: Colors.red,),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),

                 Container(

                   child: Text(
                     'The Output',
                     style: TextStyle(

                       color: Colors.red,
                       fontSize: 20,
                       fontWeight: FontWeight.w800,
                     ),
                   ),
                 ),

                  SizedBox(
                    height: 30,
                  ),
                  Container(

                    child: SelectableText(
                      result,
                      style: TextStyle(fontSize: 32.0),
                      textAlign: TextAlign.center,
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



    void process(bool isEncrypt) {
      String text = txt_controller.text;
      int key;
      String temp = "";

      try {
        key = int.parse(key_controller.text);
      } catch (e) {
        ShowAlert("Invalid Key");
      }

      for (int i = 0; i < text.length; i++) {
        int ch = text.codeUnitAt(i);
        int offset;
        String h;
        if (ch >= 'a'.codeUnitAt(0) && ch <= 'z'.codeUnitAt(0)) {
          offset = 97;
        } else if (ch >= 'A'.codeUnitAt(0) && ch <= 'Z'.codeUnitAt(0)) {
          offset = 65;
        } else if (ch == ' '.codeUnitAt(0)) {
          temp += " ";
          continue;
        } else {
          ShowAlert("Invalid Text");
          temp = "";
          break;
        }

        int c;
        if (isEncrypt) {
          c = (ch + key - offset) % 26;
        } else {
          c = (ch - key - offset) % 26;
        }
        h = String.fromCharCode(c + offset);
        temp += h;
      }

      setState(() {
        result = temp;
      });
    }

    void delete() {
      txt_controller.clear();
      key_controller.clear();
      setState(() {
        result = "";
      });
    }

    Future<void> ShowAlert(String _alert) async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('WARNING'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(_alert),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

  }



