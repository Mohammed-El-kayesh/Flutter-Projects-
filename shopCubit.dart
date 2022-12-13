import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Categories.dart';
import 'package:shopapp/CategoriesModel.dart';
import 'package:shopapp/DioHelper.dart';
import 'package:shopapp/LoginModel.dart';
import 'package:shopapp/Settings.dart';
import 'package:shopapp/components.dart';
import 'package:shopapp/endpoints.dart';
import 'package:shopapp/favouriteScreen.dart';
import 'package:shopapp/homeModel.dart';
import 'package:shopapp/products.dart';
import 'package:shopapp/shopStates.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List <Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
   // FavouriteScreen(),
    SettingScreen(),
  ];

  void changeBotton(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }
HomeModel? homeModel;
  Map<int,bool> favourite={};
  void getHomeData() {
    emit(ShopLoadingHomeDataState());

    DioHelper.getData(
        url: HOME,
      token:token,
    )
        .then((value) {
      homeModel=HomeModel.fromJson(value.data);
    // print(homeModel?.data?.banners?[0].id.toString());
    //
    //   for (var element in homeModel!.data!.products!) {
    //     if(element.in_favourite??false) {
    //       favourite[element.id!] ;
    //     }
    //   }
    //   homeModel!.data!.products!.forEach((element) {
    //     favourite.addAll({
    //       element.id!:element.in_favourite!,
    //     });
    //   });
    //   print(favourite.toString());

      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeDataState(error.toString()));
    });
  }

  CategoriesModel? categoriesModel;

  void getCategories() {
    DioHelper.getData(
      url: GET_CATEGORIES,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(ShopSuccessCategoryState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoryState(error.toString()));
    });
  }


  LoginModel? userModel;

  void getUserData() {
    emit(ShopLoadingUserDataState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = LoginModel.fromJson(value.data);
      //print(userModel!.data!.name);
      emit(ShopSuccessUserDataState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUserDataState(error.toString()));
    });
  }

  void UpdateUserData(
  {
  required String name,
    required String email,
    required String phone,
}
      ) {
    emit(ShopLoadingUserUpdateState());
    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name':name,
        'phone':phone,
        'email':email,
      },
    ).then((value) {
      userModel = LoginModel.fromJson(value.data);
      //print(userModel!.data!.name);
      emit(ShopSuccessUserUpdateState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUserUpdateState(error.toString()));
    });
  }
}
