import 'package:flutter/material.dart';
import 'package:movies_app/data/api/api_manager/api_manager.dart';
import 'package:movies_app/data/model/popular_movies/popular_results.dart';
import 'package:movies_app/sealed_result.dart';

class PopularViewModel extends ChangeNotifier{
  List<PopularResults>?popularResults;
  bool isLoading=false;
  String? errorMessage;

 void getPopularMovies()async{
   isLoading=true;
   notifyListeners();
   var response=await ApiManager.getPopularMovies();
   isLoading=false;
   switch(response){
     case Success<List<PopularResults>>():
       popularResults=response.data;
     case ServerError<List<PopularResults>>():
       errorMessage=response.message;
     case Error<List<PopularResults>>():
       errorMessage=response.exception.toString();
   }
   notifyListeners();
 }
}