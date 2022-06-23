import 'package:bloc/bloc.dart';


import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_app/layout/cubic/states.dart';



class ShopCubic extends Cubit<ShopStates> {
  ShopCubic() : super(ShopInitailState());

  static ShopCubic get(context) => BlocProvider.of(context);




}