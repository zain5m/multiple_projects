import 'package:abd/models/shop_app/login_model.dart';

abstract class ShopLoginStates {}

class ShopLoginInitialState extends ShopLoginStates {}

class ShopLoginLoadingState extends ShopLoginStates {}

class ShopLoginSccessState extends ShopLoginStates {
  final ShopLoginModel? loginModel;

  ShopLoginSccessState(this.loginModel);
}

class ShopLoginErrorState extends ShopLoginStates {
  final String error;

  ShopLoginErrorState(this.error);
}

class ShopchangePasswordVisibilityState extends ShopLoginStates {}
