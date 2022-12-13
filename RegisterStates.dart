import 'package:shopapp/LoginModel.dart';

abstract class Registerstates{}

class RegisterInitialState extends Registerstates{}

class RegisterLoadinglState extends Registerstates{}

class  RegisterSuccessState extends  Registerstates{
  final LoginModel LogM;

  RegisterSuccessState(this.LogM);
}

class  RegisterErrorState extends  Registerstates{
  final String error;

  RegisterErrorState(this.error);
}

class ChangePasswordRegisterState extends Registerstates{}