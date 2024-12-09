import 'package:flutter/material.dart';
import 'package:movies_app/screens/tabs/home_tab/popular/widgets/popular.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Popular(),
      ],
    );
  }
}
