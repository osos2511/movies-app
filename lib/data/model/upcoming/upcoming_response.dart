import 'Dates.dart';
import 'Results.dart';

class UpComingResponse {
  Dates? dates;
  num? page;
  List<Results>? results;
  num? totalPages;
  num? totalResults;
  bool? success;
  num? statusCode;
  String? message;
  UpComingResponse({
      this.dates, 
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  UpComingResponse.fromJson(dynamic json) {
    dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
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
    if (dates != null) {
      map['dates'] = dates?.toJson();
    }
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }

}