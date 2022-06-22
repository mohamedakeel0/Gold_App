

import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';



import 'package:fluttertoast/fluttertoast.dart';
import 'package:gold_app/shared/style/colors.dart';




Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        navigateTo(context, Widget);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage("${article['urlToImage']}"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "${article['title']}",
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                          fontSize: 10),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Widget articlebuilder(list, context,{isSearch=false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildArticleItem(list[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: list.length),
      fallback: (context) =>isSearch?Container():Center(child: CircularProgressIndicator()),
    );
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

      child: SCOCAIL?Center(
        child: MaterialButton(   onPressed: function,
          padding: EdgeInsets.zero,
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(
              color: Textcolor,
            ),
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
    color =Colors.orangeAccent;
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
Widget buildListProduct( model, context,{bool isOldprice=true}) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    height: 120,
    child: Row(
      children: [
        Stack(alignment: AlignmentDirectional.bottomStart, children: [
          Image(
            image: NetworkImage(
              model.image,
            ),
            fit: BoxFit.cover,
            height: 120,
            width: 120,
          ),
          if (model.discount != 0&& isOldprice)
            Container(
              color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'DISCOUNT',
                style: TextStyle(fontSize: 9, color: Colors.white),
              ),
            ),
        ]),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black, fontSize: 9, height: 1),
              ),
              Spacer(),
              Row(children: [
                Text(
                  model.price.toString(),
                  style: TextStyle(fontSize: 10, color: defaultcolor),
                ),
                SizedBox(
                  width: 5,
                ),
                if (model.discount != 0&& isOldprice)
                  Text(
                    model.oldPrice.toString(),
                    style: TextStyle(
                        fontSize: 9,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
                Spacer(),
                IconButton(
                  onPressed: () {

                  },
                  icon: CircleAvatar(
                    radius: 15.0,

                    child: Icon(
                      Icons.favorite_border,
                      size: 14.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ],
    ),
  ),
);
Widget defaultButtonSelect({
  double width = double.infinity,
  Color background = Colors.orangeAccent,
  Color Textcolor = Colors.white,
  bool isUpperCase = true,
  double radius = 3.0,

  bool shape = true,
  bool SCOCAIL = true,
  ImageProvider? Image,
  double Imageradius = 10,
  required VoidCallback? function,
  required String text,
  double height = 50.0,
   String? text1,
   String? text2,
  VoidCallback? function0,
  bool showselect = true,
}) =>
    Container(clipBehavior: Clip.antiAliasWithSaveLayer,
      width: width,
      height: height,

      child: SCOCAIL?Row(
        crossAxisAlignment:
        CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {


              },
              child: Icon(Icons
                  .check_box_outline_blank_sharp)),
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
          children: [
            TextButton(
                onPressed: () {
                  function0!();

                },
                child: Icon(Icons
                    .check_box_outline_blank_sharp)),
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
        ):

        Column(children: [
          Row(
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    function0!();

                  },
                  child: Icon(Icons
                      .check_box_outline_blank_sharp)),
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
              TextButton(
                  onPressed: () {


                  },
                  child: Icon(Icons
                      .check_box_outline_blank_sharp)),
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
                    TextButton(
                        onPressed: () {
                        },
                        child: Icon(Icons
                            .check_box_outline_blank_sharp)),
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