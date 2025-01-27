import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/string_manager.dart';
import 'package:movies_app/data/api/api_manager/api_manager.dart';
import 'package:movies_app/data/model/popular/movie.dart';
import 'package:movies_app/screens/tabs/home_tab/popular_details/viewModel/popular_details_viewModel.dart';
import 'package:movies_app/screens/tabs/home_tab/popular_details/viewModel/similar_viewModel.dart';
import 'package:movies_app/screens/tabs/home_tab/popular_details/widget/more_like_this.dart';
import 'package:movies_app/screens/tabs/home_tab/popular_details/widget/text_container_widget.dart';
import 'package:provider/provider.dart';

class PopularDetailsView extends StatefulWidget {
  const PopularDetailsView({super.key});

  @override
  State<PopularDetailsView> createState() => _PopularDetailsViewState();
}

class _PopularDetailsViewState extends State<PopularDetailsView> {
  var viewModel = PopularDetailsViewModel();
  var viewModelSimilar = SimilarViewModel();

  @override
  Widget build(BuildContext context) {
    Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;
    Movie similar = ModalRoute.of(context)?.settings.arguments as Movie;
    return ChangeNotifierProvider<PopularDetailsViewModel>(
      create: (BuildContext context) =>
          viewModel..getAllPopularDetailsMovies(movie.id),
      child: Consumer<PopularDetailsViewModel>(
          builder: (context, viewModel, child) {
        var movieItem = viewModel.popularDetailsResponse;
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (viewModel.errorMessage != null) {
          return Text(
            viewModel.errorMessage!,
            style: const TextStyle(fontSize: 16, color: Colors.red),
          );
        }

        return Scaffold(
          backgroundColor: ColorsManager.black,
          appBar: AppBar(
            backgroundColor: ColorsManager.appBarBg,
            title: Text(
              movieItem?.title ?? '',
              style: GoogleFonts.inter(
                  color: ColorsManager.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400),
            ),
            centerTitle: true,
            iconTheme:
                const IconThemeData(color: ColorsManager.white, size: 36),
          ),
          body: Column(
            children: [
              Container(
                color: ColorsManager.black,
                width: 412.w,
                height: 492.h,
                child: Column(
                  children: [
                    Image.network(
                      ApiManager.baseImage +
                          (movieItem?.backdropPath ?? ''),
                      fit: BoxFit.cover,
                      width: 412.w,
                      height: 217.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              movieItem?.title ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: ColorsManager.white,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              movieItem?.releaseDate ?? '',
                              style: const TextStyle(
                                fontSize: 10,
                                color: ColorsManager.gray,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            color: Colors.grey,
                            height: 199.h,
                            width: 129.w,
                            child: Stack(
                              children: [
                                Image.network(
                                  ApiManager.baseImage +
                                      (movieItem?.posterPath ?? ''),
                                  fit: BoxFit.cover,
                                  width: 129.w,
                                  height: 199.h,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: SvgPicture.asset(
                                      AssetsManager.bookmark),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //TextContainerWidget(),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: [
                            Container(
                              width: 231.w,
                              height: 50.h,
                              color: Colors.transparent,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 0,
                                        crossAxisSpacing: 0),
                                itemBuilder: (context, index) =>
                                    TextContainerWidget(
                                        genres: movieItem
                                                ?.genres?[index].name ??
                                            ''),
                                itemCount: movieItem?.genres?.length,
                              ),
                            ),
                            Container(
                              width: 231.w,
                              height: 100.h,
                              color: Colors.transparent,
                              child: Text(movieItem?.overview ?? '',
                                  maxLines: 6,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.inter(
                                      color: ColorsManager.textContainerBg,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.sp)),
                            ),
                            Container(
                              width: 231.w,
                              height: 30.h,
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    AssetsManager.star,
                                    width: 20.w,
                                    height: 19.h,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '${movieItem?.voteAverage?.toStringAsFixed(1)}',
                                    style: GoogleFonts.poppins(
                                        color: ColorsManager.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18.sp),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
              Container(
                color: ColorsManager.listHomeBg,
                width: 434.w,
                height: 246.h,
                child: Column(
                  children: [
                    Padding(
                      padding: REdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(StringManager.MoreLikeThis,
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 15.sp,
                                color: ColorsManager.white)),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>  MoreLikeThis(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
