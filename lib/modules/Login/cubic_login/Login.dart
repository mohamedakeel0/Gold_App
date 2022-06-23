
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_app/layout/Homescreen/HomeScreen.dart';
import 'package:gold_app/models/ModelRegister.dart';

import 'package:gold_app/modules/Login/cubic_login/cubic.dart';
import 'package:gold_app/modules/Login/cubic_login/states.dart';
import 'package:gold_app/modules/Regisiter/ThirdRegister.dart';
import 'package:gold_app/modules/Regisiter/cubic/cubic.dart';

import 'package:gold_app/modules/Regisiter/register.dart';
import 'package:gold_app/shared/componnents0/components.dart';
import 'package:gold_app/shared/style/colors.dart';


class Login_Screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();


    return BlocProvider(
      create: (context) => ShoploginCubic(),
      child: BlocConsumer<ShoploginCubic, ShopLoginStates>(
          listener: (context, state) {},
          builder: (context, state) => Scaffold(
            body: Center(
              child: SingleChildScrollView(physics: NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10,bottom: 10),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('image/Gold.jpg'),
                            //NetworkImage
                            radius: 90,
                          ),
                        ), //CircleAvata
                        Text(
                          'Login',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.black),
                        ),
                        Text(
                          'Login now to Share your talent with world',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 25,
                        ),

                        defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'please enter your email address';
                              }
                            },
                            label: 'Email Address or Moblie number',
                            prefix: Icons.email_outlined),
                        SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                            isPassword: ShoploginCubic.get(context).isPassword,

                            controller: passwordController,
                            suffix: ShoploginCubic.get(context).suffix,
                            suffixPressed: () {
                              ShoploginCubic.get(context).changePasswordvisibility();
                            },
                            type: TextInputType.visiblePassword,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'password is too short ';
                              }
                            },
                            label: 'password',
                            prefix: Icons.lock_outline),

                        SizedBox(
                          height: 20,
                        ),
                        Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
                          defaultButton(
                              function: () {
                                navigateTo(context, shop_register());
                              },
                              text: 'back',
                              shape: false,
                              width: 120,
                              Textcolor: Colors.white,
                              isUpperCase: true,
                              SCOCAIL: true,radius: 5,
                              background: Colors.amberAccent.shade100),SizedBox(width: 130,),
                          defaultButton(
                              function: () {
                                if (formkey.currentState!.validate()) {
                                  ShoploginCubic.get(context).userLogin(email:emailController.text ,password:passwordController.text ,);



                                }},
                              text: 'next',
                              shape: false,
                              width: 120,
                              Textcolor: Colors.white,
                              isUpperCase: true,
                              SCOCAIL: true,
                              background: defaultcolor,radius: 5),
                        ],),SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already a member?',
                              style:  Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.black87),
                            ),
                            TextButton(
                                onPressed: () {
                                  navigateTo(context, HomeScreen());
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
          )),
    );
  }
}