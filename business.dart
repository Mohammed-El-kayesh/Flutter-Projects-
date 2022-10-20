import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappfinal/states.dart';

import 'components.dart';
import 'cubit.dart';

// @dart=2.9

class BusinessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
     listener: (context,state){},
      builder: (context,state){
       var list=NewsCubit.get(context).business;
       return  articleBuilder(list,context);
      },
    );
  }
}
