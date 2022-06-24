import 'package:flutter/material.dart';
import 'package:gold_app/layout/Homescreen/HomeScreen.dart';
import 'package:gold_app/shared/componnents0/components.dart';

import 'package:gold_app/shared/style/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class Onboarding extends StatefulWidget {
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  var boardController = PageController();
  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'image/first.png',
        title: 'Welcome in ',
        title0: 'Goldgolio!',
        body: 'Let\'s Share your talent with world'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {

                },
                physics: BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: defaultcolor,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    navigateAndFinish(
                        context,
                        HomeScreen());
                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
          child: Image(
            image: AssetImage('${model.image}'),
          )),
      SizedBox(
        height: 30,
      ),
      RichText(
        text: TextSpan(children: [
          TextSpan(
              text:  '${model.title}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,fontStyle: FontStyle.italic,color: Colors.black87)),
          TextSpan(
              text: '${model.title0}',
              style: TextStyle(
                  fontSize:  30,
                  fontWeight: FontWeight.w800,fontStyle: FontStyle.italic,
                  color: defaultcolor))
        ]),
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        '${model.body}',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      SizedBox(
        height: 15,
      ),
    ],
  );
}

class BoardingModel {
  final String image;
  final String title;
  final String title0;
  final String body;

  BoardingModel({required this.image, required this.title,required this.title0, required this.body,});
}

