import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:anima/screens/screen1.dart';
import 'package:anima/screens/screen2.dart';
import 'package:anima/screens/screen3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Anima',
        theme: ThemeData(
          textTheme: GoogleFonts.salsaTextTheme(
            Theme.of(context).textTheme.copyWith(
              headline1: TextStyle(fontSize: 24, letterSpacing: 1.2),
              headline2: TextStyle(fontSize: 20, letterSpacing: 1.0),
            ),
          ),
          primarySwatch: Colors.blue,
        ),
      home: HomeScreen(),
      routes: {
        '/screen1': (context) => Screen1(),
        '/screen2': (context) => Screen2(),
        '/screen3': (context) => Screen3(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _navigateToScreen(context, '/screen1');
              },
              child: Text('Screen 1'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _navigateToScreen(context, '/screen2');
              },
              child: Text('Screen 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _navigateToScreen(context, '/screen3');
              },
              child: Text('Screen 3'),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, String routeName) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          if (routeName == '/screen1') {
            return Screen1();
          } else if (routeName == '/screen2') {
            return Screen2();
          } else if (routeName == '/screen3') {
            return Screen3();
          } else {
            return Container();
          }
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }
}