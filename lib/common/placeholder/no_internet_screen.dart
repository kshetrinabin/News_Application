import 'package:flutter/material.dart';

class NoInternetPlaceholderImage extends StatelessWidget {
  const NoInternetPlaceholderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Image.asset(
          "assets/images/no_internet.png",
          fit: BoxFit.cover,
          
        ),
      )
    );
  }
}