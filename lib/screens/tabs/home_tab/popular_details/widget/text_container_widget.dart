import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/data/model/popular/movie.dart';

import '../../../../../data/model/details/Genres.dart';

class TextContainerWidget extends StatelessWidget {
   TextContainerWidget({super.key,required this.genres});
String genres;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        width: 65.w,
        height: 25.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: ColorsManager.containerBg,
            width: 2,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
         genres ,
          style: GoogleFonts.inter( color:ColorsManager.textContainerBg ,fontWeight:FontWeight.w400 ,fontSize: 10.sp),
        ),
      ),
    );
  }
}
