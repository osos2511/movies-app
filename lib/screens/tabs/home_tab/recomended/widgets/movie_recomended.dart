import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/colors_manager.dart';

class MovieRecomended extends StatelessWidget {
  const MovieRecomended({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        width: 96.87.w,
        height: 127.74.h,
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 127.74.h,
                width: 96.87.w,
                child: Stack(
                  children: [
                    const Positioned.fill(
                      child: Image(
                        image: AssetImage(AssetsManager.recomended),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: SvgPicture.asset(AssetsManager.bookmark)),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
                color: ColorsManager.movie_card_bg,
              ),
              height: 56.26.h,
              width: 97.w,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          AssetsManager.star,
                          width: 15,
                          height: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "7.7",
                          style: GoogleFonts.poppins(
                              color: ColorsManager.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Deadpool 2",
                      style: GoogleFonts.poppins(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorsManager.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "2018  R  1h 59m",
                      style: GoogleFonts.inter(
                          color: ColorsManager.gray,
                          fontWeight: FontWeight.w400,
                          fontSize: 8.sp),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
