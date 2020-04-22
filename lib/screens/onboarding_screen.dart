import 'package:fitness_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  var pages = [
    PageViewModel(
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Center(child: Image.asset("assets/screen1.png", height: 175.0)),
      decoration: const PageDecoration(
        pageColor: Color(0xFF192A56),
        bodyTextStyle: TextStyle(
          color: Colors.white,fontSize: 16.0,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,fontSize: 24.0,
        ),
      ),
    ),
    PageViewModel(
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Center(child: Image.asset("assets/screen2.png", height: 175.0)),
      decoration: const PageDecoration(
       pageColor: Color(0xFF192A56),
        bodyTextStyle: TextStyle(
          color: Colors.white,fontSize: 16.0,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,fontSize: 24.0,
        ),
      ),
    ),
    PageViewModel(
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Center(child: Image.asset("assets/screen3.png", height: 175.0)),
      decoration: const PageDecoration(
        pageColor: Color(0xFF192A56),
        bodyTextStyle: TextStyle(
          color: Colors.white,fontSize: 16.0,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,fontSize: 24.0,
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: pages,
        onDone: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage(),),
          );
        },
        onSkip: () {
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage(),),
          );
        },
        showSkipButton: true,
        skip: const Icon(Icons.skip_next,color: Colors.white,),
        next: const Icon(Icons.arrow_right,color: Colors.white,),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.deepOrange,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}
