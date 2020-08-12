import 'dart:async';

import 'package:films_app/movieList.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/MoviesList': (BuildContext context) => new MoviesList()
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/MoviesList');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(Icons.image),
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/splash.jpg'), fit: BoxFit.fill)),
    );
  }
}
