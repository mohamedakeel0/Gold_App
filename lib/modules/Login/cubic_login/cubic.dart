

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_app/models/ModelRegister.dart';
import 'package:gold_app/modules/Login/cubic_login/states.dart';
import 'package:gold_app/modules/Regisiter/cubic/states.dart';
import 'package:gold_app/shared/network/End_point.dart';
import 'package:gold_app/shared/network/remot/dio_helper.dart';


class ShoploginCubic extends Cubit<ShopLoginStates>{
  ShoploginCubic() : super(ShopLoginInitailState());
  static ShoploginCubic get(context) => BlocProvider.of(context);


  late ModelTalents modelTalents;
  void userLogin(
      {required email, required password }) {
    emit(ShopLoginILoadingState());
    DioHelper.Postdata(
      url: SIGNIN,
      data: { 'email': email,'password': password,

      },
    ).then((value) {
      modelTalents= ModelTalents.fromJson(value.data);

      print(value.data);


      emit(ShopLoginSuccessState(modelTalents));
    }).catchError((error) {
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }
  IconData suffix= Icons.visibility_outlined;
  bool isPassword=true;
  void changePasswordvisibility(){
    isPassword=!isPassword;
    suffix= isPassword?Icons.visibility_outlined:Icons.visibility_off;
    emit( ShopChangePasswordVisibilityState());
  }

}