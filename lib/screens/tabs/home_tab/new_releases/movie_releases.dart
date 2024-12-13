import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/assets_manager.dart';

class MovieReleases extends StatelessWidget {
  const MovieReleases({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),

        width: 96.87.w,
        height: 127.74.h,
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height: 199.h,
            width: 129.w,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image(
                    image: AssetImage(AssetsManager.releases),
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
      ),
    );
  }
}
