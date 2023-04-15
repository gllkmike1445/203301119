import 'package:chat_by_me/screens/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';


class IntroScreen extends StatelessWidget {


  final List<Introduction> list = [
    Introduction(
      title: 'Merhabalar',
      subTitle: 'Güvenilir ve Yenilikçi Sohbet...',
      imageUrl: 'assets/intro_screen.png',
    ),
    Introduction(
      title: 'Kalite',
      subTitle: 'Tamamen Yerli Malı Sohbet Uygulaması',
      imageUrl: 'assets/intro_screen.png',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(

      backgroudColor: Colors.white,
      introductionList: list,
      onTapSkipButton: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ), //MaterialPageRoute
        );
      },
      // foregroundColor: Colors.red,
    );
  }
}
