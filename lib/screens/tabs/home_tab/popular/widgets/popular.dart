import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          width: double.infinity,
          height: 500.h,
          color: Colors.red,
          child: Column(
            children: [
            Image.asset(
            AssetsManager.splashLogo,
            fit: BoxFit.cover,
          ),
          Text(
              popularResults?.title??'',
              style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        Text(
          popularResults?.releaseDate??'',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            color: Colors.grey,
            height: 210.h,
            width: 130.w,
            child: Stack(
              children: [
                const Image(image: AssetImage(AssetsManager.splashLogo)),
                Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.bookmark_add)))
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
        )]);
  }
}
