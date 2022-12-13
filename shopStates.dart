import 'package:shopapp/LoginModel.dart';

abstract class ShopStates{}
class ShopInitialState extends ShopStates{}
class ShopChangeBottomNavState extends ShopStates{}

class ShopLoadingHomeDataState extends ShopStates{}
class ShopSuccessHomeDataState extends ShopStates{}
class ShopErrorHomeDataState extends ShopStates{
  final String error;

  ShopErrorHomeDataState(this.error);
}

class ShopSuccessCategoryState extends ShopStates{}
class ShopErrorCategoryState extends ShopStates{
  final String error;

  ShopErrorCategoryState(this.error);
}

class ShopSuccessChangeFavouritesState extends ShopStates{

}
class ShopErrorFavouritesState extends ShopStates{
  final String error;

  ShopErrorFavouritesState(this.error);
}

class ShopLoadingUserDataState extends ShopStates{}

class ShopSuccessUserDataState extends ShopStates{
  final LoginModel loginModel;

  ShopSuccessUserDataState(this.loginModel);
}
class ShopErrorUserDataState extends ShopStates{
  final String error;

  ShopErrorUserDataState(this.error);
}

class ShopLoadingUserUpdateState extends ShopStates{}

class ShopSuccessUserUpdateState extends ShopStates{
  final LoginModel loginModel;

  ShopSuccessUserUpdateState(this.loginModel);
}
class ShopErrorUserUpdateState extends ShopStates{
  final String error;

  ShopErrorUserUpdateState(this.error);
}

class ShopGetFavoritesLoadingState extends ShopStates {}

class ShopGetFavoritesSuccessState extends ShopStates {}

class ShopGetFavoritesErrorState extends ShopStates {}
