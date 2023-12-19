import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  final String text;

  const CustomWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: Duration(seconds: 1),
        builder: (context, double value, child) {
          return Opacity(
            opacity: value,
            child: child,
          );
        },
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'CustomFont',
          ),
        ),
      ),
    );
  }
}