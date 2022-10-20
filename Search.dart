import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappfinal/components.dart';
import 'package:newsappfinal/cubit.dart';
import 'package:newsappfinal/states.dart';


class Search_Screen extends StatelessWidget {
var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
      builder:(context,state){
       var list=NewsCubit.get(context).search;
        return  Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),

                  child: TextFormField(

                    decoration: InputDecoration(
                      fillColor: Colors.white70, filled: true,
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      label:Text('Search',
                      style: TextStyle(

                        color: Colors.deepOrangeAccent,
                      ),),


                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.grey),
                        ),

                    ),

                      controller: searchController,
                     // type: TextInputType.text,
                      onChanged: (value)
                      {
                        NewsCubit.get(context).getsearch(value);
                      },

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },

                    ),
                ),

              Expanded(
                  child:
                  articleBuilder(
                      list,
                      context,
                      isSearch:true)),

            ],
          ),

        );
      } ,
    );
  }
}
