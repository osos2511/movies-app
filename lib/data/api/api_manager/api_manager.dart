import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/data/model/popular_movies/popular_response.dart';
import 'package:movies_app/sealed_result.dart';
import '../../model/popular_movies/popular_movie.dart';

class ApiManager{
  //https://api.themoviedb.org/3/movie/popular
  static const String baseUrl = 'api.themoviedb.org';
  static const String popularEndPoint = '3/movie/popular';
  static const String token = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiYzdlNDY3MWQzNmJkODBmNzQ4YTBmMjBmMzUyNzZmNSIsIm5iZiI6MTczMzQxNjY1NS45NzYsInN1YiI6IjY3NTFkNmNmYWIzN2ZjZDNlODg1MGUwYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.NUArThEiyW9sCu1GQZzcONmUqY8wudaxIvGn0Ro_Nz4';
  static const String baseImage='https://image.tmdb.org/t/p/w500';

static Future<CheckData<PopularResponse>> getPopularMovies()async{
  Uri url=Uri.https(baseUrl,popularEndPoint,);
  var headers={'Authorization': token,"accept": "application/json",
  };
  try{
    http.Response serverResponse = await http.get(url, headers: headers);
    var json = jsonDecode(serverResponse.body);
    PopularResponse popularResponse = PopularResponse.fromJson(json);

    print(serverResponse.statusCode);
    //print(popularMovies.success);
    if (serverResponse.statusCode == 200) {
      print('osama');

      return Success(data: popularResponse);
    } else {
      print('youssef');
      return ServerError(message: popularResponse.message??'something wrong', code: popularResponse.statusCode??0);
    }
  }on Exception catch(e){
    print('mahmoud');
    return Error(exception: e);
  }
}
}
