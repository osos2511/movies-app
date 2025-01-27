// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:movies_app/core/utils/colors_manager.dart';
// import 'package:movies_app/data/model/popular/popular_response.dart';
//
// class SearchCard extends StatelessWidget {
//    SearchCard({super.key , required this.movie  });
// PopularResponse movie ;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: movie.posterPath != null
//           ? Container(
//         width: 140.w,
//         height: 89.h,
//         child: Image.network(
//           "https://image.tmdb.org/t/p/w92${movie.posterPath}",
//         ),
//       )
//           : Container(
//         width: 140.w,
//         height: 89.h,
//         child: Icon(Icons.movie, color: ColorsManager.white),
//       ),
//       title: Text(
//         movie.title ?? "",
//         maxLines: 1,
//         style: GoogleFonts.inter(
//             color: ColorsManager.white,
//             fontWeight: FontWeight.w400,
//             fontSize: 15.sp),
//       ),
//       subtitle: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             movie.releaseDate ?? "",
//             style: GoogleFonts.inter(
//                 fontSize: 13.sp,
//                 fontWeight: FontWeight.w400,
//                 color: ColorsManager.gray),
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           Text(
//             movie.overview ?? "",
//             style: GoogleFonts.inter(
//                 fontSize: 13.sp,
//                 fontWeight: FontWeight.w400,
//                 color: ColorsManager.gray),
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ],
//       ),
//     );
//   }
// }
