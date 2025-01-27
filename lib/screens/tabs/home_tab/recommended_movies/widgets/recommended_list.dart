import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/string_manager.dart';
import 'package:movies_app/screens/tabs/home_tab/recommended_movies/view/recommended_view.dart';
import 'package:movies_app/screens/tabs/home_tab/recommended_movies/widgets/recommended_movies.dart';
import '../../../../../data/model/popular/movie.dart';

class RecommendedList extends StatelessWidget {
   RecommendedList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.listHomeBg,
      width: 434.w,
      height: 255.h,
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
          RecommendedView(),

        ],
      ),
    );
  }
}
