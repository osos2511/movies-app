import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/screens/tabs/browse_tab/widget/browse_card.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Column(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding:  REdgeInsets.symmetric(vertical: 30.0 , horizontal: 15),
              child: Text("Browse Category " , style: GoogleFonts.inter(fontSize: 22.sp,fontWeight: FontWeight.w400, color:ColorsManager.white ),),
            ),
          ),
          Expanded(
            child: Container(
                 height: 775.h,
                 width: 600.w,
              //  color: ColorsManager.gold,
                child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ,mainAxisSpacing: 14,crossAxisSpacing: 10,mainAxisExtent: 120), itemBuilder: (context, index) => BrowseCard(),)),
          )
        ],
      ),
    );
  }
}
