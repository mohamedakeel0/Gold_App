import 'package:bloc/bloc.dart';


import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_app/models/ModelRegister.dart';
import 'package:gold_app/modules/Regisiter/ThirdRegister.dart';
import 'package:gold_app/modules/Regisiter/cubic/states.dart';
import 'package:gold_app/shared/network/End_point.dart';
import 'package:gold_app/shared/network/remot/dio_helper.dart';


class ShopRegisterCubic extends Cubit<ShopRegisterStates> {
  ShopRegisterCubic() : super(ShopRegisterInitailState());

  static ShopRegisterCubic get(context) => BlocProvider.of(context);

  late ModelTalents modelTalents;
  void userRegister(
      { required name,required phone,required email, required password ,required gender ,required  talents}) {
    emit(ShopRegisterILoadingState());
    DioHelper.Postdata(
      url: TALENTREG,query: {'talented_reg':TALENTREG},
      data: {'full_name': name,'email': email,
     'phone': phone, 'password': password,'gender': gender,'talents': talents,

   },
    ).then((value) {
      modelTalents= ModelTalents.fromJson(value.data);

      print(value.data);


      emit(ShopRegisterSuccessState(modelTalents));
    }).catchError((error) {
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));
    });
  }
  bool showselect=true;
  void changeshowselect() {
    showselect = !showselect;

    emit(ShopChangeshowselectState());}
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  onItemclick(Ckeckmodel ckeckmodel ){
    ckeckmodel.value=!ckeckmodel.value;
    emit(ShopChangeonItemclickState());
  }
  void changePasswordvisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off;
    emit(ShopRegisterChangePasswordVisibilityState());
  }
}
