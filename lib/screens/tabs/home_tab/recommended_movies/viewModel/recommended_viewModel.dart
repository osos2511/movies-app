  import 'package:flutter/material.dart';
  import 'package:movies_app/data/api/api_manager/api_manager.dart';
  import 'package:movies_app/data/model/popular/movie.dart';
  import 'package:movies_app/sealed_result.dart';

  class RecommendedViewModel extends ChangeNotifier{
    bool isLoading=false;
    String? errorMessage;
    List<Movie>? results;
    void getAllRecommendedMovies()async{
      isLoading=true;
      notifyListeners();
      var response=await ApiManager.getTopRatedMovies();
      isLoading=false;
      switch(response) {
        case Success<List<Movie>>():
          results=response.data;
        case ServerError<List<Movie>>():
         errorMessage=response.message;
        case Error<List<Movie>>():
          errorMessage=response.exception.toString();

      }
      notifyListeners();
    }
  }