import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/screens/tabs/search_tab/widget/movies_search_deleget.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsManager.black,
       title:
          Container(
            decoration: BoxDecoration(
              color: ColorsManager.containerBg,
              borderRadius: BorderRadius.circular(30),
            ),
            width: 343.w,
            height: 48.h,
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(onPressed: () {
                showSearch(context: context, delegate: MoviesSearchDeleget());
              }, icon: Icon(Icons.search , size: 32, color: ColorsManager.white,) ),
            ),
          ),

      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsManager.noMoviesFound ,height: 87.6.h,width: 78.09.w,),
            SizedBox(height: 15.h,),
            Text(
              "No movies found",
              style: GoogleFonts.inter(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorsManager.white),
            ),
          ],
        ),
      ),
    );
  }
}
