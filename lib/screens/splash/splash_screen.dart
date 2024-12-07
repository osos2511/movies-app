import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/assets_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsManager.splashLogo);
  }
}
