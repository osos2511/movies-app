import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/data/api/api_manager/api_manager.dart';
import 'package:movies_app/data/model/popular/popular_response.dart';
import 'package:movies_app/screens/tabs/search_tab/widget/search_card.dart';
import 'package:movies_app/sealed_result.dart';

class MoviesSearchDeleget extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: ColorsManager.black,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: ColorsManager.white),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(color: ColorsManager.white),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: ColorsManager.white,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: ColorsManager.black,
      child: FutureBuilder(
        future: ApiManager.searchMovies(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData && snapshot.data is Success<PopularResponse>) {
            var successData = snapshot.data as Success<PopularResponse>;
            var movies = successData.data?.results ?? [];

            if (movies.isEmpty) {
              return Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AssetsManager.noMoviesFound),
                    Text(
                      "No movies found",
                      style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorsManager.white),
                    )
                  ],
                ),
              );
            }

            return ListView.separated(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                var movie = movies[index];
                return ListTile(
                  leading: movie.posterPath != null
                      ? Container(
                    width: 140.w,
                    height: 89.h,
                    child: Image.network(
                      ApiManager.baseImage + (movie.posterPath ?? ''),
                     fit: BoxFit.fill,
                    ),
                  )
                      : Container(
                    width: 140.w,
                    height: 89.h,
                    child: Icon(Icons.movie, color: ColorsManager.white),
                  ),
                  title: Text(
                    movie.title ?? "",
                    maxLines: 1,
                    style: GoogleFonts.inter(
                        color: ColorsManager.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.releaseDate ?? "",
                        style: GoogleFonts.inter(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorsManager.gray),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        movie.overview ?? "",
                        style: GoogleFonts.inter(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorsManager.gray),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: ColorsManager.gray,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                );
              },
            );
          } else if (snapshot.data is ServerError) {
            var errorData = snapshot.data as ServerError;
            return Center(
              child: Text(
                " Server Error  : ${errorData.message}",
                style: TextStyle(color: ColorsManager.white),
              ),
            );
          } else {
            return Center(
              child: Text(
                "try agine",
                style: TextStyle(color: ColorsManager.white),
              ),
            );
          }
        },
      ),
    );
  }
}
