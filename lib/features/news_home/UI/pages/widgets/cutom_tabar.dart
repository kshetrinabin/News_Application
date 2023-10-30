// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;
  const CustomTabBar({
    Key? key,
    required this.label,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4,vertical: 2),
        height: 40,
        width: 110,
        decoration: BoxDecoration(
          color:color,
          borderRadius: BorderRadius.circular(50)
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
             label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
