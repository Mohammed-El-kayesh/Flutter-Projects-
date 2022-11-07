import 'package:flutter/material.dart';
import 'package:untitled1/methods.dart';

class PlayfairScreen extends StatefulWidget {

  @override
  State<PlayfairScreen> createState() => _PlayfairScreenState();
}

class _PlayfairScreenState extends State<PlayfairScreen> {
  TextEditingController txt_controller = TextEditingController();
  TextEditingController key_controller = TextEditingController();
  String resultE="" ;
  String resultD="" ;

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: Text('Playfair Cipher',),
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
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RaisedButton(
                        onPressed:(){
                          setState((){
                              resultE=Playfair().playfairEncrypt(txt_controller.text, key_controller.text);});

                      },
                        child: Text("Encrypt"),
                        color: Colors.blue,),


                      RaisedButton(onPressed:(){
                        setState((){
                            resultD=Playfair().playfairDecrypt(resultE, key_controller.text);});

                      },

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
                  Row(
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topStart,

                        child: Text("Encryption Text:  ",

                          style: TextStyle(fontSize: 20.0,color: Colors.black87,fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Text(resultE,style: TextStyle(fontSize: 25,color: Colors.blue,fontWeight: FontWeight.w600),),
                    ],
                  ),
                
                  SizedBox(
                    height: 40,
                  ),
                  Container(

                    child: Row(
                      children: [
                        Container(
                          alignment: AlignmentDirectional.topStart,

                          child: Text("Decryption Text:  ",

                            style: TextStyle(fontSize: 20.0,color: Colors.black87,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Text(resultD,style: TextStyle(fontSize: 25,color: Colors.green,fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void delete() {
    txt_controller.clear();
    key_controller.clear();
    setState(() {
      resultE = "";
      resultD="";
    });
  }
}
