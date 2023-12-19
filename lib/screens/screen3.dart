import 'package:flutter/material.dart';
import 'package:anima/widgets/custom_widget.dart';

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen 3')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomWidget(text: 'Flutter'),
            SizedBox(height: 20),
            Text('Dart', style: TextStyle(color: Colors.black)),
            SizedBox(height: 20),
            Container(
              width: 80,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: Duration(seconds: 1),
                builder: (context, double value, child) {
                  return Transform.translate(
                    offset: Offset(0.0, value * 50),
                    child: child,
                  );
                },
                child: Center(
                  child: Text(
                    'Widgets',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}