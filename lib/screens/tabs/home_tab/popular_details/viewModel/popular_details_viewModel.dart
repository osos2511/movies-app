import 'package:flutter/material.dart';
import 'package:movies_app/data/api/api_manager/api_manager.dart';
import 'package:movies_app/data/model/details/popular_details_response.dart';
import 'package:movies_app/sealed_result.dart';

class PopularDetailsViewModel extends ChangeNotifier {
  PopularDetailsResponse? popularDetailsResponse;
  bool isLoading = false;
  String? errorMessage;

  void getAllPopularDetailsMovies(num? movieId) async {
    isLoading = true;
    notifyListeners();
    var response = await ApiManager.detailsMovie(movieId);
    isLoading = false;
    notifyListeners();
    switch (response) {
      case Success<PopularDetailsResponse>():
        popularDetailsResponse = response.data;
      case ServerError<PopularDetailsResponse>():
        errorMessage = response.message;
      case Error<PopularDetailsResponse>():
        errorMessage = response.exception.toString();
    }
    notifyListeners();
  }
}
