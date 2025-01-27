import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/screens/tabs/watch_list_tab/widget/card_watchlist.dart';
import 'package:movies_app/screens/tabs/watch_list_tab/widget/title_watchlist.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Column(
        children: [
          TitleWatchlist(),
          SizedBox(height: 20,),
          Container(
              color: ColorsManager.black,
              width: 380.w,
              height: 685.h,
              child: ListView.builder(itemBuilder: (context, index) => CardWatchlist() ,itemCount: 20,))
        ],
      ),
    );
  }
}
