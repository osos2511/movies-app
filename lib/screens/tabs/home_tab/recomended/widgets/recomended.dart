import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/string_manager.dart';
import 'package:movies_app/screens/tabs/home_tab/new_releases/movie_releases.dart';
import 'package:movies_app/screens/tabs/home_tab/recomended/widgets/movie_recomended.dart';
import '../../../../../data/model/popular/popular_movie.dart';

class Recomended extends StatelessWidget {
   Recomended({super.key,  this.popularResults});
   PopularMovie? popularResults;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.list_home_bg,
      width: 434.w,
      height: 246.h,
      child: Column(
        children: [
          Padding(
            padding:  REdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(StringManager.Recomended
                  , style:  GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 15.sp  , color:  ColorsManager.white)
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => MovieRecomended(),),
          ),
        ],
      ),
    );
  }
}
