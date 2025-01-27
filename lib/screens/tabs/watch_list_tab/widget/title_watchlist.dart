import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/colors_manager.dart';

class TitleWatchlist extends StatelessWidget {
  const TitleWatchlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding:  REdgeInsets.symmetric(vertical: 30.0 , horizontal: 15),
        child: Text("Watchlist" , style: GoogleFonts.inter(fontSize: 22.sp,fontWeight: FontWeight.w400, color:ColorsManager.white ),),
      ),
    );
  }
}
