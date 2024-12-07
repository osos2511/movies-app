import 'package:flutter/material.dart';
import '../../screens/home_screen.dart';
import '../../screens/splash/splash_screen.dart';

class RoutesManager{
  static const String splash='/splash';
  static const String home='/home';
  static Route<dynamic>? router(RouteSettings settings){
    switch(settings.name){
      case splash:
      {
        return MaterialPageRoute(builder: (context) => SplashScreen(),);
      }
      case home:
        {
          return MaterialPageRoute(builder: (context) => HomeScreen(),);
        }
    }
    return null;
  }
}