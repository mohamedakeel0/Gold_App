




abstract class ShopLoginStates{}
class ShopLoginInitailState extends ShopLoginStates{}
class ShopLoginILoadingState extends ShopLoginStates{}
class ShopLoginSuccessState extends ShopLoginStates{


}
class ShopLoginErrorState extends ShopLoginStates{
  final String error;
  ShopLoginErrorState(this.error);
}
class ShopChangePasswordVisibilityState extends ShopLoginStates{}