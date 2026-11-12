import 'package:design_ui2/screens/home.dart';
import 'package:design_ui2/widgets/animation_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';

class Splash extends StatefulWidget {
  const new({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (c) => Home()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: SvgPicture.asset("assets/img/splash_svg/logo.svg")),
          Gap(10),
          FadeInLeftToRight(
            child: SvgPicture.asset(
              'assets/img/splash_svg/line.svg',
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
