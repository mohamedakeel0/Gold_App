import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_app/layout/Homescreen/HomeScreen.dart';
import 'package:gold_app/modules/Regisiter/SecondRegister.dart';
import 'package:gold_app/modules/Regisiter/ThirdRegister.dart';
import 'package:gold_app/shared/componnents0/components.dart';
import 'package:gold_app/shared/style/colors.dart';

import 'cubic/cubic.dart';
import 'cubic/states.dart';

class shop_register extends StatelessWidget {

  final checkBoxList=[
  Ckeckmodel(title: 'Talent'),
    Ckeckmodel(title: 'Employer'),
    Ckeckmodel(title: 'Individual'),
    Ckeckmodel(title: 'Corporate'),
  ];


  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => ShopRegisterCubic(),
      child: BlocConsumer<ShopRegisterCubic, ShopRegisterStates>(
          listener: (context, state) {},
          builder: (context, state) => Scaffold(
                body: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('image/Gold.jpg'),
                              //NetworkImage
                              radius: 100,
                            ), //CircleAvata
                            Text(
                              'Welcome!',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.black),
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'You`re in the right place ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(color: Colors.black87),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'JOIN US',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            color: defaultcolor,
                                          ),
                                    ))
                              ],
                            ),
                            Text(
                              'Join as',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.black),
                            ),
                            SizedBox(
                              height: 30,
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                defaultButtonSelect(
                                    function: () {},
                                    text: checkBoxList[0].title,value3: checkBoxList[0].value,ckeckmodel3:checkBoxList[0],context3:context,
                                    shape: false,
                                    width: 340,
                                    Textcolor: Colors.black,
                                    isUpperCase: false,
                                    SCOCAIL: true,
                                    radius: 6),
                                SizedBox(
                                  height: 10,
                                ),
                                defaultButtonSelect(
                                    text2: checkBoxList[1].title,value: checkBoxList[1].value,ckeckmodel:checkBoxList[1],context:context,
                                    height: ShopRegisterCubic.get(context)
                                        .showselect?50:100,
                                    function: () {},
                                    showselect: ShopRegisterCubic.get(context)
                                        .showselect,
                                    function0: ShopRegisterCubic.get(context)
                                        .changeshowselect,
                                    text: checkBoxList[2].title,value1: checkBoxList[2].value,ckeckmodel1:checkBoxList[2],context1:context,
                                    text1: checkBoxList[3].title,value2: checkBoxList[3].value,ckeckmodel2:checkBoxList[3],context2:context,
                                    shape: false,
                                    width: 340,
                                    Textcolor: Colors.black,
                                    isUpperCase: false,
                                    SCOCAIL: false,
                                    radius: 6),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: defaultButton(
                                      function: () {
                                        navigateTo(context, HomeScreen());
                                      },
                                      text: 'back',
                                      shape: false,
                                      width: 120,
                                      Textcolor: Colors.white,
                                      isUpperCase: true,
                                      SCOCAIL: true,
                                      radius: 5,
                                      background: Colors.amberAccent.shade100),
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                defaultButton(
                                    function: () {
                                      navigateTo(context, Second_register());
                                    },
                                    text: 'next',
                                    shape: false,
                                    width: 120,
                                    Textcolor: Colors.white,
                                    isUpperCase: true,
                                    SCOCAIL: true,
                                    background: defaultcolor,
                                    radius: 5),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already a member?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(color: Colors.black87),
                                ),
                                TextButton(
                                    onPressed: () {
                                      navigateTo(context, HomeScreen());
                                    },
                                    child: Text(
                                      'Log In',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              color: defaultcolor,
                                              fontSize: 18),
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
