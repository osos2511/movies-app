import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../data/model/popular_movies/popular_results.dart';

class Popular extends StatelessWidget {
   Popular({super.key,  this.popularResults});
  PopularResults? popularResults;

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
            Image.asset(
            AssetsManager.poster,
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
                        //popularResults?.title??'',
                        "Dora and the lost city of gold",
                        style: TextStyle(fontSize: 14, color: ColorsManager.white),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        //popularResults?.releaseDate??'',
                        "2019  PG-13  2h 7m",
                        style: TextStyle(fontSize: 10, color: ColorsManager.gray),
                      ),
                    ),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  color: Colors.grey,
                  height: 199.h,
                  width: 129.w,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image(
                          image: AssetImage(AssetsManager.popular),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () {},
                          icon:  Icon(
                            Icons.bookmark_add,
                            color: ColorsManager.gray,
                          ),
                        ),
                      ),
                    ],
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
