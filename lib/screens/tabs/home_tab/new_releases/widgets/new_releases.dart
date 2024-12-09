import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/screens/tabs/home_tab/new_releases/widgets/movie_releases.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../data/model/popular_movies/popular_results.dart';

class NewReleases extends StatelessWidget {
   NewReleases({super.key,  this.popularResults});
  PopularResults? popularResults;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.releases_bg,
      width: 420.w,
      height: 187.h,
      child: Column(
        children: [
          Text("New Releases "
              , style:  GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 15.sp  , color:  ColorsManager.white)
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => MovieReleases(),),
          ),
        ],
      ),
    );
  }
}
