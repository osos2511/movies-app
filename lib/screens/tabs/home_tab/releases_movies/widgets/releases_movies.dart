import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/string_manager.dart';
import 'package:movies_app/data/model/upcoming/Results.dart';
import 'package:movies_app/screens/tabs/home_tab/releases_movies/view/upcoming_view.dart';


class ReleasesMovies extends StatelessWidget {
   ReleasesMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.listHomeBg,
      width: 420.w,
      height: 187.h,
      child: Column(
        children: [
          Padding(
            padding:  REdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(StringManager.new_releases
                  , style:  GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 15.sp  , color:  ColorsManager.white)
              ),
            ),
          ),
          const UpcomingView(),
        ],
      ),
    );
  }
}
