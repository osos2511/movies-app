import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data/model/popular_movies/Results.dart';

class HomeTab extends StatelessWidget {
   HomeTab({super.key});
List<Results>? results;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Column(
            children: [
      CarouselSlider(
      options: CarouselOptions(
        height: 200.0, // ارتفاع العنصر
        // autoPlay: true, // التشغيل التلقائي
        enlargeCenterPage: true, // تكبير العنصر المركزي
        aspectRatio: 16 / 9, // نسبة العرض إلى الارتفاع
        autoPlayInterval: Duration(seconds: 3), // المدة الزمنية بين التمريرات
        autoPlayAnimationDuration: Duration(milliseconds: 800), // مدة الحركة
        viewportFraction: 0.8, // حجم العنصر المرئي نسبةً إلى الشاشة
      ), items: const [],
      // items: results.map((imageUrl) {
      //   return Builder(
      //     builder: (BuildContext context) {
      //       return Container(
      //         width: MediaQuery.of(context).size.width,
      //         margin: EdgeInsets.symmetric(horizontal: 5.0),
      //         decoration: BoxDecoration(
      //           color: Colors.amber,
      //         ),
      //       );
      //     },
        //);
      //}).toList(),
    ),
            ],
          )
        ],
      ),
    );
  }
}
