import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/colors_manager.dart';

class CardWatchlist extends StatelessWidget {
  const CardWatchlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 358.w,
          height: 102.5.h,
          child: ListTile(
            leading: Container(
              width: 140.w,
              height: 89.h,
              child: Image.asset(
                AssetsManager.watchList,
                fit: BoxFit.fill,
              ),
            ),
            title: Text(
             "Alita Battle Angel",
              maxLines: 1,
              style: GoogleFonts.inter(
                  color: ColorsManager.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "2019",
                  style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: ColorsManager.gray),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Rosa Salazar, Christoph Waltz",
                  style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: ColorsManager.gray),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        Container(height: 2,  width: double.infinity, color: Color(0xFF707070),),
      ],
    );
  }
}
