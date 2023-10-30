import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/features/news_home/UI/pages/news_homeScreen.dart';
import 'package:news_app/features/splash/UI/widgets/splash_body.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(PageTransition(
          child: const NewsInitialHomeScreen(sourceId: ""), type: PageTransitionType.fade));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SplashBody();
  }
}