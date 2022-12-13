

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:shopapp/Cubit.dart';
import 'package:shopapp/Sharedpreference.dart';
import 'package:shopapp/States.dart';
import 'package:shopapp/components.dart';
import 'package:shopapp/registerScreen.dart';

import 'Layout.dart';


class LogIn extends StatelessWidget {
var formkKey=GlobalKey<FormState>();
  var emailController=TextEditingController();
var passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {

          return BlocProvider(
            create: (BuildContext context)=>LoginCubit(),
            child: BlocConsumer<LoginCubit,Loginstates>(
              listener:(context,state){
                if(state is loginSuccessState)
                  {
                   if(state.LogM.status!)
                     {
                       print(state.LogM.message);
                       print(state.LogM.data!.token);
                       CacheHelper.saveData(key: 'token',
                           value: state.LogM.data!.token).then((value) {
                             token=state.LogM.data!.token!;
                             navigateAndFinish(context, Layout());
                       });

                     }
                   else
                     {
                       print(state.LogM.message);
                       showToast(
                           text: state.LogM.message!,
                           state:ToastState.ERROR,
                       );

                     }
                  }
              },
              builder:(context,state){
                return Scaffold(
                  appBar: AppBar(
                  ),
                  body: Center(
                    child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: formkKey,
                            child: Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                Text('LOGIN',
                                    style: Theme.of(context).textTheme.headline4!.copyWith(
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text('Login now to browse our hot offers',
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.grey,
                                  ),),
                                SizedBox(
                                  height: 30.0,
                                ),
                                TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'email must not be empty';
                                    }
                                  },

                                  decoration: InputDecoration(
                                    label: Text('Email Address'),
                                    prefixIcon: Icon(
                                      Icons.email_outlined, color: Colors.orangeAccent,

                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  onFieldSubmitted: (value){
                                    if(formkKey.currentState!.validate()) {
                                      LoginCubit.get(context).userLogin(
                                          email: emailController.text,
                                          password: passwordController.text);
                                    }

                                  },

                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'password must not be short';
                                    }
                                  },
                                  obscureText:LoginCubit.get(context).isPassword ,
                                  decoration: InputDecoration(
                                    label: Text('Password'),
                                    prefixIcon: Icon(
                                      Icons.lock_outline_rounded,
                                      color: Colors.orangeAccent,
                                    ),

                                    suffixIcon: IconButton(
                                      onPressed: (){
                                        LoginCubit.get(context).changePasswordVisibility();
                                      },
                                      icon: Icon(
                                        Icons.visibility,
                                        color: Colors.orangeAccent,
                                      ),
                                    ),





                                  ),

                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Conditional.single(
                                    context: context,
                                    conditionBuilder: (BuildContext context)=> state is! loginLoadinglState,
                                    widgetBuilder: (BuildContext context)=>defaultButton(
                                      function: (){
                                        if(formkKey.currentState!.validate()) {
                                          LoginCubit.get(context).userLogin(
                                              email: emailController.text,
                                              password: passwordController.text);
                                        }
                                      },
                                      text: 'LOGIN',background: Colors.deepOrangeAccent),
                                    fallbackBuilder:(BuildContext context) =>Center(child: CircularProgressIndicator()), ),


                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Don\'t have an account?'),
                                    TextButton(
                                      onPressed: (){
                                        navigateTo(context, RegisterScreen());
                                      },
                                      child: Text('Register now..',
                                      style: TextStyle(
                                        color: Colors.orangeAccent
                                      ),),
                                    ),
                                  ],
                                ),



                              ],
                            ),
                          ),
                        ),
                      ),
                  ),

                );
              },
            ),
          );

  }
}
