import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/data/model/popular_movies/Popular_movies.dart';

class ApiManager{
  //https://api.themoviedb.org/3/movie/popular
  static const String baseUrl = 'api.themoviedb.org';
  static const String popularEndPoint = '/3/movie/popular';
  static const String token = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiYzdlNDY3MWQzNmJkODBmNzQ4YTBmMjBmMzUyNzZmNSIsIm5iZiI6MTczMzQxNjY1NS45NzYsInN1YiI6IjY3NTFkNmNmYWIzN2ZjZDNlODg1MGUwYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.NUArThEiyW9sCu1GQZzcONmUqY8wudaxIvGn0Ro_Nz4';

Future<PopularMovies?> getPopularMovies()async{
  Uri url=Uri.https(baseUrl,popularEndPoint);
  var headers={'Authorization': 'Bearer $token',
  };
    http.Response serverResponse = await http.get(url,headers: headers);
    if (serverResponse.statusCode==200) {
      var json = jsonDecode(serverResponse.body);
     return PopularMovies.fromJson(json);
    }
 return null;
}
}
