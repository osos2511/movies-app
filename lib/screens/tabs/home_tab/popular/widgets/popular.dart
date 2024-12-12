import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/data/api/api_manager/api_manager.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../data/model/popular_movies/popular_movie.dart';

class Popular extends StatelessWidget {
   Popular({super.key,  this.popularResults});
   PopularMovie? popularResults;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: ColorsManager.black,
          width: 412.w,
          height: 289.h,
          child: Stack(
            children: [
            Image.network(
            ApiManager.baseImage+popularResults!.backdropPath!,
             fit: BoxFit.cover,
              width: 412.w,
              height: 217.h,
          ),
              Padding(
                padding:  REdgeInsets.symmetric(horizontal: 50.0 , vertical: 20),
                child: Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        popularResults?.title??'',
                        style: const TextStyle(fontSize: 14, color: ColorsManager.white),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                      popularResults?.releaseDate??'',

                        style: const TextStyle(fontSize: 10, color: ColorsManager.gray),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    color: Colors.grey,
                    height: 199.h,
                    width: 129.w,
                    child: Stack(
                      children: [
                        Image(
                          image: NetworkImage(ApiManager.baseImage+popularResults!.posterPath!),
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: SvgPicture.asset(AssetsManager.bookmark),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],
    ),
            // Column(
            // children: [
            //   CarouselSlider(
            //   options: CarouselOptions(
            //     height: 200.0, // ارتفاع العنصر
            //     // autoPlay: true, // التشغيل التلقائي
            //     enlargeCenterPage: true, // تكبير العنصر المركزي
            //     aspectRatio: 16 / 9, // نسبة العرض إلى الارتفاع
            //     autoPlayInterval: Duration(seconds: 3), // المدة الزمنية بين التمريرات
            //     autoPlayAnimationDuration: Duration(milliseconds: 800), // مدة الحركة
            //     viewportFraction: 0.8, // حجم العنصر المرئي نسبةً إلى الشاشة
            //   ), items: const [],
            //   // items: results.map((imageUrl) {
            //   //   return Builder(
            //   //     builder: (BuildContext context) {
            //   //       return Container(
            //   //         width: MediaQuery.of(context).size.width,
            //   //         margin: EdgeInsets.symmetric(horizontal: 5.0),
            //   //         decoration: BoxDecoration(
            //   //           color: Colors.amber,
            //   //         ),
            //   //       );
            //   //     },
            //     //);
            //   //}).toList(),
            // ),
          // ],
      //   );
      // }).toList(),
      // options: CarouselOptions(
      //   height: 400.h,
      //   enlargeCenterPage: true,
      //   autoPlay: true,
      //   autoPlayInterval: const Duration(seconds: 3),
      //   viewportFraction: 0.8,
      //   aspectRatio: 16 / 9,
      // ),
        ),
      ]);
  }
}
