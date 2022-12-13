
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Search.dart';
import 'package:shopapp/Sharedpreference.dart';
import 'package:shopapp/components.dart';
import 'package:shopapp/shopCubit.dart';
import 'package:shopapp/shopStates.dart';


class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit=ShopCubit.get(context);
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context, state) {},
      builder: (context,state){
        return   Scaffold(
          appBar: AppBar(
            title: Text('Home',
            style: TextStyle(
                color: Colors.deepOrange
            ),),
          actions: [
            IconButton(
              icon: Icon(Icons.search,
                color: Colors.deepOrange,),
              onPressed: (){
                navigateTo(context, SearchScreen());
              },
            ),
          ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index)
            {
              cubit.changeBotton(index);
            },
            currentIndex: cubit.currentIndex,

            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home,),
                label: 'Home',),
          BottomNavigationBarItem(
            icon: Icon(Icons.category,),
            label: 'Categories',
              ),
        // BottomNavigationBarItem(
        // icon: Icon(Icons.favorite,),
        // label: 'Favourite',),
        BottomNavigationBarItem(
        icon: Icon(Icons.settings,),
        label: 'Settings',
        ),
            ],


          ),

        );
    },



    );
  }
}
