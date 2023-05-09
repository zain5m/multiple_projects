import 'package:abd/models/shop_app/login_model.dart';

abstract class ShopRegisterStates {}

class ShopRegisterInitialState extends ShopRegisterStates {}

class ShopRegisterLoadingState extends ShopRegisterStates {}

class ShopRegisterSccessState extends ShopRegisterStates {
  final ShopLoginModel? loginModel;

  ShopRegisterSccessState(this.loginModel);
}

class ShopRegisterErrorState extends ShopRegisterStates {
  final String error;

  ShopRegisterErrorState(this.error);
}

class ShopRegisterchangePasswordVisibilityState extends ShopRegisterStates {}
