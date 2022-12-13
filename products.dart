
import 'dart:ui';

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:shopapp/CategoriesModel.dart';
import 'package:shopapp/homeModel.dart';
import 'package:shopapp/shopCubit.dart';
import 'package:shopapp/shopStates.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener:(context,state)=>{},
      builder:(context,state)
          {
           return Conditional.single(
              context: context,
              conditionBuilder: (BuildContext context) =>  ShopCubit.get(context).homeModel != null &&
                  ShopCubit.get(context).categoriesModel != null,
              widgetBuilder: (BuildContext context) =>builderWidget(ShopCubit.get(context).homeModel!,
                  ShopCubit.get(context).categoriesModel!, context),
              fallbackBuilder: (BuildContext context) => Center(
                child: CircularProgressIndicator(),
              ),
            );



          },
    );
  }
}
Widget builderWidget(HomeModel model,CategoriesModel categoriesModel,context)=>
    SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
  children: [
          CarouselSlider(
            items: model.data?.banners
                ?.map(
                  (e) => Image(
                    image: NetworkImage('${e.image}'),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: 250.0,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),

      ),

      SizedBox(
        height: 10.0,
      ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(''
                   'Categories',
                 style: TextStyle(
                   fontSize: 24,
                   fontWeight: FontWeight.w800,
                   color: Colors.orangeAccent,
                 ),
               ),
               SizedBox(
                 height: 10.0,
               ),
    Container(
      height: 100.0,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => buildCategoryItem(categoriesModel.data!.data![index]),
                separatorBuilder: (context,index)=>SizedBox(width: 10.0,),
                itemCount: categoriesModel.data!.data!.length,
      ),
    ),
               SizedBox(
                 height: 20.0,
               ),
    Text(''
        'New Products',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color: Colors.orangeAccent,
      ),
    ),
             ],
           ),
         ),
    SizedBox(
      height:10 ,
    ),

    Container(
      color: Colors.grey[300],
      child:model.data!.products!.isEmpty?Container(): GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        childAspectRatio: 1 / 1.58,

        children:List.generate(
          model.data!.products!.length,
              (index) =>
                  buildProducts(model.data!.products![index],context),
        ),
      ),
    ),
            ],


      ),
        );


Widget buildCategoryItem(DataModel model)=>Stack(
  alignment: AlignmentDirectional.bottomCenter,
  children: [
    Image(
      image: NetworkImage(model.image!),
      height: 100.0,
      width: 100.0,
      fit: BoxFit.cover,
    ),
    Container(
      color: Colors.black.withOpacity(.7),
      width: 100.0,


      child: Text(

        model.name!,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(

          color: Colors.white,
        ),
      ),
    ),
  ],

);



Widget buildProducts(ProductModel model,context)=>
    Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(model.image!),
                width: double.infinity,
                height: 175.0,
              ),
              if (model.discount != 0)
                Container(
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  child: Text(
                    'DISCOUNT',
                    style: TextStyle(
                      fontSize: 8.0,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.0,
                    height: 1.3,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${model.price.round()}',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    if (model.discount != 0)
                      Text(
                        '${model.oldprice.round()}',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: CircleAvatar(
                        radius: 15.0,
                        backgroundColor: Colors.grey,
                        // backgroundColor:
                        // ShopCubit.get(context).favourite[model.id]!? Colors.blue:
                        // Colors.grey,
                        child: Icon(
                          Icons.favorite_border,
                          size: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

