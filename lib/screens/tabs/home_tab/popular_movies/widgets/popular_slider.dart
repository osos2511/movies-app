import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/data/api/api_manager/api_manager.dart';

import '../../../../../data/model/popular/popular_movie.dart';

class PopularSlider extends StatelessWidget {
  final List<PopularMovie> popularResults;

  PopularSlider({super.key, required this.popularResults});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: popularResults.length,
      itemBuilder: (context, index, realIndex) {
        final movie = popularResults[index];
        return Stack(
          children: [
            Container(
              color: ColorsManager.black,
              width: double.infinity,
              height: 300.h,
              child: Stack(
                children: [
                  Image.network(
                    ApiManager.baseImage + (movie.backdropPath ?? ''),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 217.h,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey,
                      child: const Center(child: Text("Image Not Available")),
                    ),
                  ),
                  Padding(
                    padding: REdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            movie.title ?? '',
                            style: const TextStyle(
                              fontSize: 14,
                              color: ColorsManager.white,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            movie.releaseDate ?? '',
                            style: const TextStyle(
                              fontSize: 10,
                              color: ColorsManager.gray,
                            ),
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
                            Image.network(
                              ApiManager.baseImage + (movie.posterPath ?? ''),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image, size: 50),
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
            ),
          ],
        );;
      },
      options: CarouselOptions(
        height: 300.h,
        enlargeCenterPage: true,
        autoPlay: false,
        viewportFraction: 0.8,
        aspectRatio: 16 / 9,

      ),
    );
  }


}
