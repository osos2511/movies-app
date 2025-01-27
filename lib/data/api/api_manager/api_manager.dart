import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/data/model/details/popular_details_response.dart';
import 'package:movies_app/data/model/popular/movie.dart';
import 'package:movies_app/data/model/similar/Similar_response.dart';
import 'package:movies_app/data/model/upcoming/Results.dart';
import 'package:movies_app/data/model/upcoming/upcoming_response.dart';
import 'package:movies_app/sealed_result.dart';
import '../../model/popular/popular_response.dart';

class ApiManager {
  //https://api.themoviedb.org/3/movie/popular
  //https://api.themoviedb.org/3/movie/upcoming
  //https://api.themoviedb.org/3/movie/top_rated
  //https://api.themoviedb.org/3/movie/912649
  static const String baseUrl = 'api.themoviedb.org';
  static const String popularEndPoint = '3/movie/popular';
  static const String searchEndPoint = '3/search/movie';
  static const String upcomingEndPoint = '/3/movie/upcoming';
  static const String detailsEndPoint = '/3/movie/';
  static const String topRatedEndPoint = '/3/movie/top_rated';
  static const String token =
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiYzdlNDY3MWQzNmJkODBmNzQ4YTBmMjBmMzUyNzZmNSIsIm5iZiI6MTczMzQxNjY1NS45NzYsInN1YiI6IjY3NTFkNmNmYWIzN2ZjZDNlODg1MGUwYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.NUArThEiyW9sCu1GQZzcONmUqY8wudaxIvGn0Ro_Nz4';
  static const String baseImage = 'https://image.tmdb.org/t/p/w500';

  static Future<CheckData<PopularResponse>> getPopularMovies() async {
    Uri url = Uri.https(
      baseUrl,
      popularEndPoint,
    );
    var headers = {
      'Authorization': token,
    };
    try {
      http.Response serverResponse = await http.get(url, headers: headers);
      var json = jsonDecode(serverResponse.body);
      PopularResponse popularResponse = PopularResponse.fromJson(json);

      //print(serverResponse.statusCode);
      //print(popularMovies.success);
      if (serverResponse.statusCode == 200) {
        return Success(data: popularResponse);
      } else {
        return ServerError(
            message: popularResponse.message ?? 'something wrong',
            code: popularResponse.statusCode ?? 0);
      }
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }

  static Future<CheckData<PopularResponse>> searchMovies(String query) async {
    Uri url = Uri.https(baseUrl, searchEndPoint, {'query': query});
    var headers = {
      'Authorization': token,
    };
    try {
      http.Response serverResponse = await http.get(url, headers: headers);
      var json = jsonDecode(serverResponse.body);
      PopularResponse popularResponse = PopularResponse.fromJson(json);
      //print(serverResponse.statusCode);
      //print(popularMovies.success);
      if (serverResponse.statusCode == 200) {
        return Success(data: popularResponse);
      } else {
        return ServerError(
            message: popularResponse.message ?? 'something wrong',
            code: popularResponse.statusCode ?? 0);
      }
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }

  static Future<CheckData<List<Results>>> getUpcomingMovies() async {
    Uri url = Uri.https(baseUrl, upcomingEndPoint);
    var headers = {
      'Authorization': token,
    };
    try {
      http.Response serverResponse = await http.get(url, headers: headers);
      var json = jsonDecode(serverResponse.body);
      UpComingResponse upComingResponse = UpComingResponse.fromJson(json);

      print(upComingResponse.statusCode);
      if (serverResponse.statusCode == 200) {
        // print('hi');
        return Success(data: upComingResponse.results ?? []);
      } else {
        return ServerError(
            message: upComingResponse.message ?? 'something wrong',
            code: upComingResponse.statusCode ?? 0);
      }
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }

  static Future<CheckData<PopularDetailsResponse>> detailsMovie(num? movieId) async {
    Uri url = Uri.https(
      baseUrl,
      '$detailsEndPoint$movieId',
    );    {
      var headers = {
        'Authorization': token,
      };
      try {
        http.Response serverResponse = await http.get(url, headers: headers);
        var json = jsonDecode(serverResponse.body);
        PopularDetailsResponse detailsPopular =
            PopularDetailsResponse.fromJson(json);
        if (serverResponse.statusCode == 200) {
          return Success(data: detailsPopular);
        } else {
          return ServerError(
              message: detailsPopular.message ?? "Error",
              code: detailsPopular.statusCode ?? 0);
        }
      } on Exception catch (e) {
        return Error(exception: e);
      }
    }
  }
  static Future<CheckData<List<Results>>> getSimilarMovie(num? movieId) async {
    Uri url = Uri.https(
      baseUrl,
      '$detailsEndPoint$movieId/similar',
    );    {
      var headers = {
        'Authorization': token,
      };
      try {
        http.Response serverResponse = await http.get(url, headers: headers);
        var json = jsonDecode(serverResponse.body);
        SimilarResponse similarResponse =
            SimilarResponse.fromJson(json);
        if (serverResponse.statusCode == 200) {
          return Success(data: similarResponse.results ?? []);
        } else {
          return ServerError(
              message: "Error",
              code:  0);
        }
      } on Exception catch (e) {
        return Error(exception: e);
      }
    }
  }

  static Future<CheckData<List<Movie>>> getTopRatedMovies() async {
    Uri url = Uri.https(baseUrl, topRatedEndPoint);
    var headers = {
      'Authorization': token,
    };
    try {
      http.Response serverResponse = await http.get(url, headers: headers);
      var json = jsonDecode(serverResponse.body);
      PopularResponse popularResponse = PopularResponse.fromJson(json);
      if (serverResponse.statusCode == 200) {
        return Success(data: popularResponse.results ?? []);
      } else {
        return ServerError(
            message: popularResponse.message ?? 'something wrong',
            code: popularResponse.statusCode ?? 0);
      }
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }
}
