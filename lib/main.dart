import 'package:festival_poster_maker/view/screens/HomeScreen.dart';
import 'package:festival_poster_maker/view/screens/edit.dart';
import 'package:festival_poster_maker/view/screens/editScreen.dart';
import 'package:festival_poster_maker/view/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Color(0xff1D2539)));
  runApp(const FestivalPoster());
}

class FestivalPoster extends StatelessWidget {
  const FestivalPoster({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        'home': (context) => HomeScreen(),
        'edit': (context) => Edit(),
        'editScreen': (context) => EditScreen(),
      },
    );
  }
}
