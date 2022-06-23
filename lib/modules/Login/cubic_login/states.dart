




import 'package:gold_app/models/ModelRegister.dart';

abstract class ShopLoginStates{}
class ShopLoginInitailState extends ShopLoginStates{}
class ShopLoginILoadingState extends ShopLoginStates{}
class ShopLoginSuccessState extends ShopLoginStates{
  final ModelTalents modelTalents;

  ShopLoginSuccessState(this.modelTalents);


}
class ShopLoginErrorState extends ShopLoginStates{
  final String error;
  ShopLoginErrorState(this.error);
}
class ShopChangePasswordVisibilityState extends ShopLoginStates{}