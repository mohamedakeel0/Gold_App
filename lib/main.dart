import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_app/layout/cubic/cubic.dart';
import 'package:gold_app/shared/bloc_observer/blocObserver.dart';

import 'package:gold_app/shared/network/remot/dio_helper.dart';
import 'package:gold_app/shared/style/Theme.dart';


import 'layout/cubic/states.dart';
import 'modules/Regisiter/cubic/cubic.dart';
import 'modules/first/firstscreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();


  Bloc.observer = MyBlocObserver();

  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ShopCubic()

        ),


        BlocProvider(
            create: (context) =>  ShopRegisterCubic()),
      ],
      child: BlocConsumer<ShopCubic, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(

            debugShowCheckedModeBanner: false,
            theme: lightTheme,

            home: Onboarding(),
          );
        },
      ),
    );
  }
}
