import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news_home/resources/repositary/news_repositary.dart';
import 'package:news_app/features/splash/UI/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
      return RepositoryProvider(
        create: (context) => NewsRepositary(),
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "Josefin Sans"
            ),  
            home: const SplashScreen(),
          ),
      );
  }
  
  }


