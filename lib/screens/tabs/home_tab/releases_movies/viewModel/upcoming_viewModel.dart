import 'package:flutter/material.dart';
import 'package:movies_app/data/model/upcoming/Results.dart';
import '../../../../../data/api/api_manager/api_manager.dart';
import '../../../../../sealed_result.dart';

class UpcomingViewModel extends ChangeNotifier{
  List<Results>?newReleases;
  bool isLoading=false;
  String? errorMessage;

  void getAllUpcomingMovies()async{
    isLoading=true;
    notifyListeners();
    var response=await ApiManager.getUpcomingMovies();
    isLoading=false;
    switch(response){
      case Success<List<Results>>():
        newReleases=response.data;
      case ServerError<List<Results>>():
        errorMessage=response.message;
      case Error<List<Results>>():
        errorMessage=response.exception.toString();
    }
    notifyListeners();
  }
}