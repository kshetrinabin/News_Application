import 'package:flutter/material.dart';

class TitleRichText extends StatelessWidget {
  const TitleRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return  RichText(
                  text:const TextSpan(
                    text: "Global",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                      fontFamily: "Josefin Sans"
                    ),
                    children: [
                      TextSpan(
                        text: "Times",
                        style: TextStyle(
                          color: Colors.black45,
                        )
                      )
                    ]
            ) );
  }
}