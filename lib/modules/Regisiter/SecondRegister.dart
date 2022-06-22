import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_app/models/ModelRegister.dart';
import 'package:gold_app/modules/Login/Shoplogin.dart';
import 'package:gold_app/modules/Regisiter/ThirdRegister.dart';
import 'package:gold_app/modules/Regisiter/register.dart';
import 'package:gold_app/shared/componnents0/components.dart';
import 'package:gold_app/shared/style/colors.dart';

import 'cubic/cubic.dart';
import 'cubic/states.dart';

class Second_register extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController GenderController = TextEditingController();
    TextEditingController PhoneController = TextEditingController();

    return BlocProvider(
      create: (context) => ShopRegisterCubic(),
      child: BlocConsumer<ShopRegisterCubic, ShopRegisterStates>(
          listener: (context, state) {},
          builder: (context, state) => Scaffold(
            body: Center(
              child: SingleChildScrollView(physics: NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10,top: 20,bottom: 10),
                  child: Form(
                    key: formkey,
                    child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('image/Gold.jpg'),
                          //NetworkImage
                          radius: 70,
                        ), //CircleAvata
                        Text(
                          'Personal information',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.black),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                            controller: nameController,
                            type: TextInputType.name,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'please enter your name';
                              }
                            },
                            label:  'Full Name',
                            prefix: Icons.person),
                        SizedBox(
                          height: 15,
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
                            isPassword: ShopRegisterCubic.get(context).isPassword,

                            controller: passwordController,
                            suffix: ShopRegisterCubic.get(context).suffix,
                            suffixPressed: () {
                              ShopRegisterCubic.get(context).changePasswordvisibility();
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
                          height: 15,
                        ),
                        defaultFormField(


                            controller: GenderController,

                            type: TextInputType.text,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'Enter Gender ';
                              }
                            },
                            label: 'Gender',
                            prefix: Icons.family_restroom_outlined),
                        SizedBox(
                          height: 15,
                        ),
                        defaultFormField(


                            controller: PhoneController,

                            type: TextInputType.text,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'Enter Phone ';
                              }
                            },
                            label: 'Phone',
                            prefix: Icons.phone_android_outlined),
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
      ModelTalents model=ModelTalents(password:passwordController.text ,email:emailController.text ,phone:PhoneController.text ,fullName: nameController.text,gender: GenderController.text,);
      navigateTo(context, Third_register(modelTalents:model));


    }},
                              text: 'next',
                              shape: false,
                              width: 120,
                              Textcolor: Colors.white,
                              isUpperCase: true,
                              SCOCAIL: true,
                              background: defaultcolor,radius: 5),
                        ],),SizedBox(height: 20,),
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
                                  navigateTo(context, Shoplogin());
                                },
                                child: Text(
                                  'Log In',
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