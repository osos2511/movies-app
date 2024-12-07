import 'results.dart';

class PopularMovies {
  num? page;
  List<Results>? results;
  num? totalPages;
  num? totalResults;
  bool? success;
  num? statusCode;
  String? message;

  PopularMovies(
      {this.page,
      this.results,
      this.totalPages,
      this.totalResults,
      this.success,
      this.message,
      this.statusCode});

  PopularMovies.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    success = json['success'];
    statusCode = json['status_code'];
    message = json['status_message'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}
