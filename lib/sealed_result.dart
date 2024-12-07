sealed class CheckData<T>{

}
class Success<T> extends CheckData<T>{
  T data;
  Success({required this.data});
}
class ServerError<T> extends CheckData<T>{
  num? code;
  String? message;
  ServerError({required this.message,required this.code});
}
class Error<T> extends CheckData<T>{
  Exception exception;
  Error({required this.exception});
}