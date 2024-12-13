import 'popular_movie.dart';

class PopularResponse {
  num? page;
  List<PopularMovie>? results;
  num? totalPages;
  num? totalResults;
  bool? success;
  num? statusCode;
  String? message;

  PopularResponse({
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,
  this.success,this.statusCode,this.message
  });

  PopularResponse.fromJson(dynamic json) {
    //print(json['id']);
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(PopularMovie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    success=json['success'];
    statusCode=json['status_code'];
    message=json['status_message'];

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