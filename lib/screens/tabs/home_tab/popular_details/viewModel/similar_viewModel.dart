import 'package:flutter/material.dart';
import 'package:movies_app/data/api/api_manager/api_manager.dart';
import 'package:movies_app/data/model/details/popular_details_response.dart';
import 'package:movies_app/data/model/similar/Similar_response.dart';
import 'package:movies_app/data/model/upcoming/Results.dart';
import 'package:movies_app/sealed_result.dart';

class SimilarViewModel extends ChangeNotifier{
  List<Results>? SimlarMovies;
 bool isLoading=false;
  String? errorMessage;

 void getAllSimilarMovies(num? movieId)async{
   isLoading=true;
   notifyListeners();
   var response=await ApiManager.getSimilarMovie(movieId);
   isLoading=false;
   notifyListeners();
   switch(response){
     case Success<List<Results>>():
       SimlarMovies=response.data ;
     case ServerError<List<Results>>():
       errorMessage=response.message;
     case Error<List<Results>>():
       errorMessage=response.exception.toString();
   }
   notifyListeners();
 }
}


