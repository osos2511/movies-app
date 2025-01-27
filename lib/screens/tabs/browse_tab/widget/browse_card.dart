import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/colors_manager.dart';

class BrowseCard extends StatelessWidget {
  const BrowseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            AssetsManager.browseCard,
           // fit: BoxFit.cover,
            width: 158.w,
            height: 90.h,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text("Action" , style: GoogleFonts.poppins(color: ColorsManager.white , fontWeight: FontWeight.w600 , fontSize: 16.sp),),
        ),
      ],
    );
  }
}
