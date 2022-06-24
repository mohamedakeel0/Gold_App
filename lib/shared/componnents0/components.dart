



import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';



import 'package:fluttertoast/fluttertoast.dart';
import 'package:gold_app/modules/Regisiter/ThirdRegister.dart';
import 'package:gold_app/modules/Regisiter/cubic/cubic.dart';
import 'package:gold_app/shared/style/colors.dart';







Widget defaultFormField({
  required TextEditingController? controller,
  required TextInputType? type,
  EdgeInsetsGeometry? contentPadding,
  TextStyle? textStyle,
  TextStyle? labelStyle,
  InputBorder? enabledBorder,
  bool isPassword = false,
  ValueChanged? change,
  VoidCallback? suffixPressed,
  required FormFieldValidator validate,
  required String? label,
  IconData? prefix,

  OutlineInputBorder? myfocusborder,
  ValueChanged? onSubmit,
  IconData? suffix,
  bool isClickable = true,
  GestureTapCallback? TapWhenClick,

}) =>
    TextFormField(
      onTap: TapWhenClick,
      controller: controller,
      style: textStyle,
      keyboardType: type,
      obscureText: isPassword,
      validator: validate,
      enabled: isClickable,
      onChanged: change,
     onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
        enabledBorder: enabledBorder,
        labelText: label,
        labelStyle: labelStyle,
focusedBorder: myfocusborder,
        contentPadding: contentPadding,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: OutlineInputBorder(),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      ( route ){return false;},
);

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.white12,
  Color Textcolor = Colors.white,
  bool isUpperCase = true,
  double radius = 3.0,
  bool shape = true,
  bool SCOCAIL = true,
  ImageProvider? Image,
  double Imageradius = 10,
  required VoidCallback? function,
  required String text,

}) =>
    Container(clipBehavior: Clip.antiAliasWithSaveLayer,
      width: width,
      height: 50.0,

      child: SCOCAIL?MaterialButton(   onPressed: function,
        padding: EdgeInsets.zero,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,textAlign: TextAlign.center,

          style: TextStyle(
            color: Textcolor,
          ),
        ),
      ):MaterialButton(
        onPressed: function,
            padding: EdgeInsets.zero,
        child: Row(
          children: [
          CircleAvatar(
            backgroundImage:Image, //NetworkImage
            radius: Imageradius,
          ),
          SizedBox(width:10,),
            Expanded(
              child: AutoSizeText(
                text,
                maxLines: 2,
                style:  TextStyle(color: Textcolor,)
              ),
            ),



        ],),
      ),
      decoration:shape?ShapeDecoration(
        color: Colors.red,
        shape: StadiumBorder(
          side: BorderSide(
            width: 2,
            color: Colors.white,
          ),
        ),
      ): BoxDecoration(
        border: Border.all(color: Colors.black12),
        color: background,borderRadius: BorderRadius.circular(
        radius,
      ),
      ),
    );
void ShowToast({required String text,required  Toaststates state})=>  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);
enum Toaststates{SUCCESS,ERROR,WARNING}
Color chooseToastColor(Toaststates state){
  Color color;
switch(state){
  case Toaststates.SUCCESS:
    color =defaultcolor;
  break;
  case Toaststates.ERROR:
    color =Colors.red;
    break;
  case Toaststates.WARNING:
    color = Colors.amber;
    break;
}
return color ;
}

Widget defaultButtonSelect({
  double width = double.infinity,
  Color background = Colors.orangeAccent,
  Color Textcolor = Colors.white,
  bool isUpperCase = true,
  double radius = 3.0,

  bool shape = true,
  bool Arowa = false,
  bool SCOCAIL = true,
  ImageProvider? Image,
  double Imageradius = 10,
  required VoidCallback? function,
  required String text,
  double height = 50.0,
  bool value =false,
  bool value1 =false,
  bool value2 =false,
  bool value3 =false,
  String? text1,
  Ckeckmodel? ckeckmodel,
  Ckeckmodel? ckeckmodel1,
  Ckeckmodel? ckeckmodel2,
  Ckeckmodel? ckeckmodel3,

   String? text2,
  VoidCallback? function0,
  VoidCallback? functionaroow,
  BuildContext? context,
  BuildContext? context1,
  BuildContext? context2,
  BuildContext? context3,
  bool showselect = true,
}) =>
    Container(clipBehavior: Clip.antiAliasWithSaveLayer,
      width: width,
      height: height,

      child: SCOCAIL?Row(
        crossAxisAlignment:
        CrossAxisAlignment.center,
        children: [
          Container(height: 30,width:35,child: Checkbox(value:value3, onChanged: (value){
            ShopRegisterCubic.get(context3).onItemclick(ckeckmodel3!);

          } )),
          Expanded(
            child:  Text(
              isUpperCase ? text.toUpperCase() : text,
              style: TextStyle(
                color: Textcolor,
              ),
            ),
          ),

        ],
      ):Column(children: [
       showselect? Row(
          crossAxisAlignment:
          CrossAxisAlignment.center,
          children: [Container(height: 30,width:35,child: Checkbox(value:value, onChanged: (value){
              ShopRegisterCubic.get(context).onItemclick(ckeckmodel!);
              function0!();

            }, )),
            Expanded(
              child:  Text(
                isUpperCase ? text.toUpperCase() : text,
                style: TextStyle(
                  color: Textcolor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 10),
              child: InkWell(onTap:(){
                function0!();
              },
                child: Icon(
                  Icons.keyboard_arrow_down,
                  size: 25,
                  color: undefaultcolor,
                ),
              ),
            ),
          ],
        ):

        Column(children: [
          Row(
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [
              Container(height: 30,width:35,child: Checkbox(value:value, onChanged: (value){
                ShopRegisterCubic.get(context).onItemclick(ckeckmodel!);
                function0!();

              } )),
              Expanded(
                child:  Text(
                  isUpperCase ? text.toUpperCase() : text,
                  style: TextStyle(
                    color: Textcolor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 10),
                child: InkWell(onTap:(){
                  function0!();

                },
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: 25,
                    color: defaultcolor,
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [
              Container(height: 50,width:35,child: Checkbox(value:value2, onChanged: (value){
                ShopRegisterCubic.get(context).onItemclick(ckeckmodel2!);

              } )),
              Expanded(
                child:  Text(
                  isUpperCase ? text1!.toUpperCase() : text1!,
                  style: TextStyle(
                    color: Textcolor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  children: [
                    Container(height: 50,width:35,child: Checkbox(value:value1, onChanged: (value){
                      ShopRegisterCubic.get(context).onItemclick(ckeckmodel1!);

                    } )),
                    Text(
                      text2!,
                      style: TextStyle(
                        color: Textcolor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],)
      ],),
      decoration:shape?ShapeDecoration(
        color: Colors.red,
        shape: StadiumBorder(
          side: BorderSide(
            width: 2,
            color: Colors.white,
          ),
        ),
      ): BoxDecoration( border: Border.all(color: Colors.amber),
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: Colors.white,
      ),
    );