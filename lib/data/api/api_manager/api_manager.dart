import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/data/model/popular_movies/Popular_movies.dart';
import 'package:movies_app/data/model/popular_movies/popular_results.dart';
import 'package:movies_app/sealed_result.dart';

class ApiManager{
  //https://api.themoviedb.org/3/movie/popular
  static const String baseUrl = 'api.themoviedb.org';
  static const String popularEndPoint = '/3/movie/popular';
  static const String token = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiYzdlNDY3MWQzNmJkODBmNzQ4YTBmMjBmMzUyNzZmNSIsIm5iZiI6MTczMzQxNjY1NS45NzYsInN1YiI6IjY3NTFkNmNmYWIzN2ZjZDNlODg1MGUwYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.NUArThEiyW9sCu1GQZzcONmUqY8wudaxIvGn0Ro_Nz4';

static Future<CheckData<List<PopularResults>>> getPopularMovies()async{
  Uri url=Uri.https(baseUrl,popularEndPoint);
  var headers={'Authorization': 'Bearer $token',
  };
  try{
    http.Response serverResponse = await http.get(url, headers: headers);
    var json = jsonDecode(serverResponse.body);
    PopularMovies popularMovies = PopularMovies.fromJson(json);
    if (popularMovies.statusCode == 200) {
      return Success(data: popularMovies.results??[]);
    } else {
      return ServerError(message: popularMovies.message!, code: popularMovies.statusCode!);
    }
  }on Exception catch(e){
    return Error(exception: e);
  }

}
}
