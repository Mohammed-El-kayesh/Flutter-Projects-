import 'LoginModel.dart';

abstract class Loginstates{}

class loginInitialState extends Loginstates{}

class loginLoadinglState extends Loginstates{}

class loginSuccessState extends Loginstates{
  final LoginModel LogM;

  loginSuccessState(this.LogM);
}

class loginErrorState extends Loginstates{
  final String errro;

  loginErrorState(this.errro);
}
class ChangePasswordState extends Loginstates{}