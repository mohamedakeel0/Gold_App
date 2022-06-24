// ignore: file_names
import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_app/models/ModelRegister.dart';
import 'package:gold_app/layout/Homescreen/HomeScreen.dart';
import 'package:gold_app/modules/Regisiter/SecondRegister.dart';
import 'package:gold_app/modules/Regisiter/register.dart';
import 'package:gold_app/modules/first/firstscreen.dart';
import 'package:gold_app/shared/componnents0/components.dart';
import 'package:gold_app/shared/style/colors.dart';

import 'cubic/cubic.dart';
import 'cubic/states.dart';

class Third_register extends StatelessWidget {
  late ModelTalents modelTalents;
  Third_register({required this.modelTalents });
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();

    final checkBoxList0=[
      Ckeckmodel(title: 'Director'),
      Ckeckmodel(title: 'Videographer'),
      Ckeckmodel(title: 'Editor'),
      Ckeckmodel(title: 'Singer'),
      Ckeckmodel(title: 'Colorist'),
      Ckeckmodel(title: 'Sound Engineer'),
      Ckeckmodel(title: 'Writter'),
      Ckeckmodel(title: 'Production Manager'),
      Ckeckmodel(title: 'Voice Over'),
      Ckeckmodel(title: 'Other'),
    ];
    final checkBoxList=[
      Ckeckmodel(title: 'Actor'),
      Ckeckmodel(title: 'Photographer'),
      Ckeckmodel(title: 'Graphic Designer'),
      Ckeckmodel(title: 'Art Director'),
      Ckeckmodel(title: 'Stylist & Fashion'),
      Ckeckmodel(title: 'Makeup Artist'),
      Ckeckmodel(title: 'Journalist'),
      Ckeckmodel(title: 'Football player'),
      Ckeckmodel(title: 'Model'),
      Ckeckmodel(title: 'Producer'),
    ];

    return BlocProvider(
      create: (context) => ShopRegisterCubic(),
      child: BlocConsumer<ShopRegisterCubic, ShopRegisterStates>(
          listener: (context, state) {


          },
          builder: (context, state) => Scaffold(
            body: SingleChildScrollView(physics: NeverScrollableScrollPhysics(),
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
                      SizedBox(height: 20,),
                      Text(
                        'What talents do you have ?',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.black,fontSize: 18),
                      ),
                      SizedBox(height: 5,),
                      Text(
                          'Maxmum of 3 talent can be selected',
                          style: TextStyle(color: Colors.black54,fontSize: 13,fontFamily: 'Quicksand',fontWeight: FontWeight.bold)
                      ),
                      SizedBox(height: 5,),
                      Row(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(width: 185,
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) => Container(),
                              itemBuilder: (context, index) {

                                return
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Container(height: 30,width:35,child: Checkbox(value:checkBoxList[index].value, onChanged: (value){
                                        ShopRegisterCubic.get(context).onItemclick(checkBoxList[index]);
                                        talents.add(checkBoxList[index].title);

                                      } , )),
                                      Text(
                                        checkBoxList[index].title,
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .copyWith(
                                            color: Colors.black,
                                            fontSize: 15),
                                      ),

                                    ],
                                  );
                              },
                              itemCount: checkBoxList.length,
                            ),
                          ),
                          Container(width: 185,
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) => Container(),
                              itemBuilder: (context, index) {

                                return
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Container(height: 30,width:35,child: Checkbox(value:checkBoxList0[index].value, onChanged: (value){
                                        ShopRegisterCubic.get(context).onItemclick(checkBoxList0[index]);
                                        talents.add(checkBoxList[index].title);
                                      } )),
                                      Text(
                                        checkBoxList0[index].title,
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .copyWith(
                                            color: Colors.black,
                                            fontSize: 15),
                                      ),

                                    ],
                                  );
                              },
                              itemCount: checkBoxList0.length,
                            ),
                          ),
                        ],),
                      SizedBox(
                        height: 20,
                      ),
                      Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        defaultButton(
                            function: () {
                              navigateTo(context, Onboarding());
                            },
                            text: 'back',
                            shape: false,
                            width: 120,
                            Textcolor: Colors.white,
                            isUpperCase: true,
                            SCOCAIL: true,radius: 5,
                            background: Colors.amberAccent.shade100),SizedBox(width: 100,),
                        defaultButton(
                            function: () {
                              print(talents.length);
                              if(talents.length<=3) {
                                ShopRegisterCubic.get(context).userRegister(
                                    email: modelTalents.email,
                                    gender: modelTalents.gender,
                                    phone: modelTalents.phone,
                                    password: modelTalents.password,
                                    name: modelTalents.fullName,
                                    talents: talents);
                                ShowToast(
                                    text: 'Success', state: Toaststates.SUCCESS);
                                navigateTo(context, Onboarding());
                              }else{
                                navigateTo(context, Third_register(modelTalents: modelTalents,));
                                talents.clear();
                                ShowToast(
                                    text: 'Maxmum of 3 talent can be selected', state: Toaststates.ERROR);

                              }
                            },
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

                                navigateTo(context, HomeScreen());
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
          )),

    );

  }



  List<String> talents = [];





}
class Ckeckmodel{
  String title;
  bool value;

  Ckeckmodel({required this.title, this.value=false});

}