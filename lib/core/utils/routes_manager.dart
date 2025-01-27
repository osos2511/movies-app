import 'package:flutter/material.dart';
import 'package:movies_app/data/model/popular/popular_response.dart';
import 'package:movies_app/screens/tabs/home_tab/popular_details/view/popular_details_view.dart';
import '../../screens/home_screen.dart';
import '../../screens/splash/splash_screen.dart';

class RoutesManager {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String popularDetails = '/popularDetails';
  static Route<dynamic>? router(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        {
          return MaterialPageRoute(
            builder: (context) => SplashScreen(),
          );
        }
      case home:
        {
          return MaterialPageRoute(
            builder: (context) => HomeScreen(),
          );
        }
      case popularDetails:
        {

          return MaterialPageRoute(
            settings: settings,
            builder: (context) => PopularDetailsView(),
          );
        }
    }
    return null;
  }
}