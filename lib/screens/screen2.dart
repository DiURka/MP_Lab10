import 'package:flutter/material.dart';
import 'package:anima/widgets/custom_widget.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomWidget(text: 'Widget A'),
            SizedBox(height: 20),
            Text('Widget B', style: TextStyle(color: Colors.black)),
            SizedBox(height: 20),
            Container(
              width: 120,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: Duration(seconds: 1),
                builder: (context, double value, child) {
                  return Transform.rotate(
                    angle: value * 2 * 3.141,
                    child: child,
                  );
                },
                child: Center(
                  child: Text(
                    'Widget C',
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