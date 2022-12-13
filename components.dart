


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopapp/Sharedpreference.dart';
import 'package:shopapp/logIn.dart';


String token='';

Widget myDivider()=>Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);



void navigateTo(context,widget)=> Navigator.push(context,
    MaterialPageRoute(
      builder: (context)=>widget,
    ));
void navigateAndFinish(context,widget)
=>Navigator.pushAndRemoveUntil(
    context,MaterialPageRoute(builder: (context)=>widget,),
    (Route<dynamic> route)=>false,
);

Widget defaultButton({
  double width=double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  required Function function,
  double radius = 3.0,
  required String text,
})=>
    Container(
      width: width,
        height: 50.0,
        child: MaterialButton(
        onPressed: (){function();},
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius,),
        color: background,
      ),
    );
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword=false,
required Function validate,
required String label,
required IconData prefix,
IconData? suffix,
Function? suffixPressed,
bool isClickable=true,
})=>
TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  enabled: isClickable,
  onFieldSubmitted: onSubmit!(),
  onChanged: onChange!(),
  onTap: onTap!(),
  validator: validate(),
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: suffix != null
        ? IconButton(
      onPressed: suffixPressed!(),
      icon: Icon(
        suffix,
      ),
    )
        : null,
    border: OutlineInputBorder(),
  ),

);

//TextFormField(
//                           controller: passwordController,
//                           keyboardType: TextInputType.visiblePassword,
//                           validator: (value){
//                             if(value!.isEmpty){
//                               return 'password must not be empty';
//                             }
//                           },
//                           decoration: InputDecoration(
//                             label: Text('Password'),
//                             prefixIcon: Icon(
//                               Icons.lock_outline_rounded,
//
//                             ),
//                             suffixIcon: Icon(
//                               Icons.visibility,
//                             )
//                           ),
//                         ),

void showToast({
  required String text,
  required ToastState state,
})=>  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor:chooseToastColor(state),
    textColor: Colors.black87,
    fontSize: 16.0
);

enum ToastState{SUCCESS,ERROR,WARNING}

Color ?chooseToastColor(ToastState state)
{
  Color color;
  switch(state)
  {
    case ToastState.SUCCESS:
      color= Colors.green;
      break;
    case ToastState.WARNING:
      color= Colors.amber;
          break;
    case ToastState.ERROR:
      color=Colors.red;
          break;

  }
  return color;
}
// void signOut() {
//   CacheHelper.removeData(key: 'token').then((value) {
//     if (value) {
//       navigateAndFinish(context, LogIn(),);
//     }
//   });
// }

void signOut (context)
{
  CacheHelper.removeData(key: 'token',).then((value) {
    if(value)
      {
        navigateAndFinish(context, LogIn(),);
      }

  });
}
