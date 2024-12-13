import 'package:flutter/material.dart';
import 'package:movies_app/screens/tabs/home_tab/new_releases/new_releases.dart';
import 'package:movies_app/screens/tabs/home_tab/popular_movies/view/popular_view.dart';
import 'package:movies_app/screens/tabs/home_tab/recomended/widgets/recomended.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PopularView(),
        const SizedBox(height: 30,),
        NewReleases(),
        const SizedBox(height: 30,),
        Recomended(),

      ],
    );
  }
}
