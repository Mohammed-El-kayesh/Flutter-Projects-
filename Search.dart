// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shopapp/SearchCubit.dart';
// import 'package:shopapp/SearchStates.dart';
//
// class SearchScreen extends StatelessWidget {
// var formKey=GlobalKey<FormState>();
// var searchController=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context)=>SearchCubit(),
//       child: BlocConsumer<SearchCubit,SearchStates>(
//         listener: (context, state) {},
//         builder: (context,state){
//           return   Scaffold(
//             appBar: AppBar(title: Text('Search'),),
//             body: Form(
//               key: formKey,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       controller: searchController,
//                       keyboardType: TextInputType.text,
//                       onFieldSubmitted: (String text){
//                         SearchCubit.get(context).search(text);
//                       },
//                       validator: (value){
//                         if(value!.isEmpty){
//                           return 'enter text to search';
//                         }
//                         return null;
//                       },
//
//                       decoration: InputDecoration(
//
//                         label: Text('Search'),
//
//                         prefixIcon: Icon(
//                           Icons.search, color: Colors.orangeAccent,
//
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     if(state is SearchLoadingState)
//                 LinearProgressIndicator(),
//               return ListView.separated(
//               physics: const BouncingScrollPhysics(),
//           itemBuilder: (context, index) => buildFavoritesItem(
//           cubit.searchData?.data.data[index], context,
//           isOldPrice: false),
//           separatorBuilder: (context, index) => myDivider(),
//           itemCount: cubit.searchData!.data.data.
//           length
//           );
//         },
//       );
//
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//
//       );
//
//   }
//

import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
