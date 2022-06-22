// ignore: file_names
import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_app/models/ModelRegister.dart';
import 'package:gold_app/modules/Login/Shoplogin.dart';
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
                              separatorBuilder: (context, index) => Container(height: 10,),
                              itemBuilder: (context, index) {

                                return
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      InkWell(onTap:(){
                                        talents.add(titles[index]);
                                      },
                                        child: Icon(Icons
                                            .check_box_outline_blank_sharp,color: Colors.grey,),
                                      ),
                                      Text(
                                        '${titles[index]}',
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
                              itemCount: titles.length,
                            ),
                          ),
                          Container(width: 185,
                            child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => Container(height: 10,),
                            itemBuilder: (context, index) {

                              return
                                Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    InkWell(onTap:(){
                                      talents.add(titles0[index]);

                                    },
                                      child: Icon(Icons
                                          .check_box_outline_blank_sharp,color: Colors.grey,),
                                    ),
                                    AutoSizeText(
                                      '${titles0[index]}',
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
                            itemCount: titles0.length,
                          ),)
                        ],),
                      SizedBox(
                        height: 20,
                      ),
                      Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        defaultButton(
                            function: () {
                              print(talents);
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
                              ShopRegisterCubic.get(context).userRegister(email: modelTalents.email,gender:modelTalents.gender ,phone:modelTalents.phone ,password:modelTalents.password ,name: modelTalents.fullName,talents:talents );
                              navigateTo(context, Onboarding());
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
          )),

    );

  }
  List<String> talents = [];

  List<String> titles = [
    'Actor ',
    'Photographer ',
    'Graphic Designer ',
    'Art Director ',
    'Stylist & Fashion ',
    'Makeup Artist ',
    'Journalist ',
    'Football player ',
    'Model ',
    'Producer  ',

  ];

  List<String> titles0 = [
    'Director ',
    'Videographer ',
    'Editor ',
    'Singer ',
    'Colorist ',
    'Sound Engineer ',
    'Writter ',
    'Production Manager ',
    'Voice Over ',
    'Other  ',

  ];
}