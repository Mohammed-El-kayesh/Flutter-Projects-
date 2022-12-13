


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/DioHelper.dart';
import 'package:shopapp/LoginModel.dart';
import 'package:shopapp/RegisterStates.dart';
import 'package:shopapp/endpoints.dart';

class RegisterCubit extends Cubit<Registerstates>
{
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context)=>BlocProvider.of(context);
  LoginModel? LogM;
  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  })
  {
    emit(RegisterLoadinglState());
    DioHelper.postData(url: REGISTER,
      data: {
       'name':name,
        'email':email,
        'password':password,
        'phone':phone,

      },).then((value) {
      print(value.data);
      LogM=LoginModel.fromJson(value.data);
      print(LogM!.data!.token);
      print(LogM!.status);
      print(LogM!.message);
      emit(RegisterSuccessState(LogM!));
    }).catchError((error){
      print(error.toString());
      emit(RegisterErrorState(error.toString()));

    },);

  }

  IconData suffix=Icons.visibility;
  bool isPassword=true;
  void changePasswordVisibility()
  {
    isPassword=!isPassword;
    suffix= isPassword? Icons.visibility: Icons.visibility_off;
    emit(ChangePasswordRegisterState());

  }
}