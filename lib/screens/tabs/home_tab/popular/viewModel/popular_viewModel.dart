import 'package:flutter/material.dart';
import 'package:movies_app/data/api/api_manager/api_manager.dart';
import 'package:movies_app/data/model/popular_movies/popular_movie.dart';
import 'package:movies_app/data/model/popular_movies/popular_response.dart';
import 'package:movies_app/sealed_result.dart';

class PopularViewModel extends ChangeNotifier{
 PopularResponse?popularResponse;
  bool isLoading=false;
  String? errorMessage;

 void getAllPopularMovies()async{
   isLoading=true;
   notifyListeners();
   var response=await ApiManager.getPopularMovies();
   isLoading=false;
   switch(response){
     case Success<PopularResponse>():
       popularResponse=response.data;
     case ServerError<PopularResponse>():
       errorMessage=response.message;
     case Error<PopularResponse>():
       errorMessage=response.exception.toString();
   }

   notifyListeners();
 }
}