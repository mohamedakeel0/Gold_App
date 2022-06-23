import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_app/modules/Login/cubic_login/Login.dart';
import 'package:gold_app/modules/Regisiter/register.dart';
import 'package:gold_app/shared/componnents0/components.dart';
import 'package:gold_app/shared/style/colors.dart';

import '../../modules/Login/cubic_login/cubic.dart';
import '../../modules/Login/cubic_login/states.dart';
class HomeScreen extends StatelessWidget {
@override
Widget build(BuildContext context) {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  return BlocProvider(
    create: (context) => ShoploginCubic(),
    child: BlocConsumer<ShoploginCubic, ShopLoginStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(

          body: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage:AssetImage('image/Gold.jpg'), //NetworkImage
                          radius: 100,
                        ), //CircleAvata
                        Text(
                          'Welcome Back!',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.black),
                        ),SizedBox(
                          height: 15,
                        ),
                        Text(
                            'Let\'s Share your talent with world',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.grey[600]),
                        ),
                        SizedBox(
                          height: 30,
                        ),defaultButton(function: ()
                        {
                          navigateTo(context, Login_Screen());

                        }, text: 'Sign up with Email',shape: false,width: 350,Textcolor: Colors.black,isUpperCase: false),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          '-------------------------------- OR --------------------------------',
                          style: TextStyle(color: Colors.black87)
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.start,children: [
                          defaultButton(function: (){}, text: 'Sign up with Google',shape: false,width:180,Textcolor: Colors.black,isUpperCase: false,SCOCAIL: false,Image:  AssetImage('image/google.jpg'),Imageradius:15),
                          SizedBox(
                           width:5,
                          ),
                          defaultButton(function: (){}, text: 'Sign up with Facebook',shape: false,width: 180,Textcolor: Colors.black,isUpperCase: false,SCOCAIL: false,Image:  AssetImage('image/face.png'),Imageradius:15,),
                        ],), SizedBox(
                          height: 50,
                        ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don`t have an account?',
                      style:  Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.black87),
                    ),
                    TextButton(
                        onPressed: () {
                          navigateTo(context, shop_register());
                        },
                        child: Text(
                          'Sign Up',
                          style:  Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: defaultcolor,),
                        ))
                  ],
                ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
}

