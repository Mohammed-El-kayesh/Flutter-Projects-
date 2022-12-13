import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:shopapp/Layout.dart';
import 'package:shopapp/RegisterCubit.dart';
import 'package:shopapp/RegisterStates.dart';
import 'package:shopapp/Sharedpreference.dart';
import 'package:shopapp/components.dart';

class RegisterScreen extends StatelessWidget {
  var formkKey=GlobalKey<FormState>();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var nameController=TextEditingController();
  var phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>RegisterCubit(),
      child: BlocConsumer<RegisterCubit,Registerstates>(
        listener: (context,state){
          if(state is RegisterSuccessState)
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
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkKey,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Text('REGISTER',
                            style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                            )),
                        Text('Register now to browse our hot offers',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.grey,
                          ),),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'name must not be empty';
                            }
                          },

                          decoration: InputDecoration(
                            label: Text('Name'),
                            prefixIcon: Icon(
                              Icons.person, color: Colors.orangeAccent,

                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
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
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'phone must not be empty';
                            }
                          },

                          decoration: InputDecoration(
                            label: Text('phone'),
                            prefixIcon: Icon(
                              Icons.phone, color: Colors.orangeAccent,

                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,

                          validator: (value){
                            if(value!.isEmpty){
                              return 'password must not be short';
                            }
                          },
                          obscureText:RegisterCubit.get(context).isPassword ,
                          decoration: InputDecoration(
                            label: Text('Password'),
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded,
                              color: Colors.orangeAccent,
                            ),

                            suffixIcon: IconButton(
                              onPressed: (){
                               RegisterCubit.get(context).changePasswordVisibility();
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
                          conditionBuilder: (BuildContext context)=> state is! RegisterLoadinglState,
                          widgetBuilder: (BuildContext context)=>defaultButton(
                              function: (){
                                if(formkKey.currentState!.validate()) {
                                  RegisterCubit.get(context).userRegister(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phone: phoneController.text
                                  );
                                }
                              },
                              text: 'REGISTER',background: Colors.deepOrangeAccent),
                          fallbackBuilder:(BuildContext context) =>Center(child: CircularProgressIndicator()), ),


                        SizedBox(
                          height: 10.0,
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
