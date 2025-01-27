import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/screens/tabs/home_tab/popular_movies/view/popular_view.dart';
import 'package:movies_app/screens/tabs/home_tab/recommended_movies/widgets/recommended_list.dart';
import 'package:movies_app/screens/tabs/home_tab/releases_movies/widgets/releases_movies.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         PopularView(),
        const RSizedBox(height: 30,),
        ReleasesMovies(),
        const RSizedBox(height: 20,),
        RecommendedList(),

      ],
    );
  }
}
