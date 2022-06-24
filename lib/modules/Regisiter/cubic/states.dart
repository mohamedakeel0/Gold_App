



import 'package:gold_app/models/ModelRegister.dart';

abstract class ShopRegisterStates{}
class ShopRegisterInitailState extends ShopRegisterStates{}
class ShopRegisterILoadingState extends ShopRegisterStates{}
class ShopRegisterSuccessState extends ShopRegisterStates{
   final ModelTalents modelTalents;

  ShopRegisterSuccessState(this.modelTalents);

}
class ShopRegisterErrorState extends ShopRegisterStates{
  final String error;
  ShopRegisterErrorState(this.error);
}
class ShopChangeshowselectState extends ShopRegisterStates{}
class ShopChangeonItemclickState extends ShopRegisterStates{}
class ShopRegisterChangePasswordVisibilityState extends ShopRegisterStates{}