import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/components.dart';
import 'package:shopapp/shopCubit.dart';
import 'package:shopapp/shopStates.dart';

class SettingScreen extends StatelessWidget {
var nameController=TextEditingController();
var emailController=TextEditingController();
var phoneController=TextEditingController();
var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return
     BlocConsumer<ShopCubit,ShopStates>(
      listener: (context, state) {},

     builder: (context,state){
        var model =ShopCubit.get(context).userModel;

        nameController.text=model!.data!.name!;
        emailController.text=model.data!.email!;
        phoneController.text=model.data!.phone!;
        return  ConditionalBuilder(
         condition: ShopCubit.get(context).userModel!=null,
          builder: (context)=>Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if(state is ShopLoadingUserUpdateState)
                    LinearProgressIndicator(
                      color: Colors.deepOrangeAccent,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'name must not be empty';
                        } return null;
                      },
                      decoration: InputDecoration(
                        label: Text('Name'),
                        prefixIcon: Icon(
                          Icons.person, color: Colors.orangeAccent,
                        ),

                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(

                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'email must not be empty';
                        } return null;
                      },
                      decoration: InputDecoration(
                        label: Text('Email Address',),
                        prefixIcon: Icon(
                          Icons.email, color: Colors.orangeAccent,
                        ),

                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'phone must not be empty';
                        } return null;
                      },
                      decoration: InputDecoration(
                        label: Text('Phone'),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.orangeAccent,
                        ),

                      ),
                    ),
                    SizedBox(height: 20.0,),
                    defaultButton(
                        radius: 10.0,
                        width: 250,
                        background: Colors.deepOrangeAccent,
                        function: (){
                          signOut(context);
                        },
                        text: 'LOGOUT'),
                    SizedBox(height: 20.0,),
                    defaultButton(
                      radius: 10.0,
                        width: 200,
                        background: Colors.deepOrangeAccent,
                        function: (){
                        if(formKey.currentState!.validate()) {
                          ShopCubit.get(context).UpdateUserData(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,

                          );
                        }
                        },
                        text: 'UPDATE'),
                  ],

                ),
              ),
            ),
          ),
          fallback: (context)=> Center(child: CircularProgressIndicator()),
        );

     },
     );



  }
}
