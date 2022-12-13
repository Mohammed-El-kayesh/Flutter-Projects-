import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/DioHelper.dart';
import 'package:shopapp/LoginModel.dart';
import 'package:shopapp/States.dart';
import 'package:shopapp/endpoints.dart';




class LoginCubit extends Cubit<Loginstates>
{
 LoginCubit() : super(loginInitialState());

  static LoginCubit get(context)=>BlocProvider.of(context);
  LoginModel? LogM;
  void userLogin({
  required String email,
    required String password,
})
  {
    emit(loginLoadinglState());
    DioHelper.postData(url: LOGIN,
        data: {
      'email':email,
      'password':password,

        },).then((value) {
          print(value.data);
         LogM=LoginModel.fromJson(value.data);
         print(LogM!.data!.token);
          print(LogM!.status);
          print(LogM!.message);
          emit(loginSuccessState(LogM!));
    }).catchError((error){
      print(error.toString());
      emit(loginErrorState(error.toString()));

    },);

  }

  IconData suffix=Icons.visibility;
  bool isPassword=true;
  void changePasswordVisibility()
  {
    isPassword=!isPassword;
    suffix= isPassword? Icons.visibility: Icons.visibility_off;
    emit(ChangePasswordState());

  }
}