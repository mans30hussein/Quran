import 'package:dio/dio.dart';

class ErrorHandler {
  static String handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return "Connection timeout";
        case DioExceptionType.sendTimeout:
          return "Send timeout";
        case DioExceptionType.receiveTimeout:
          return "Receive timeout";
        case DioExceptionType.badResponse:
          return "Bad response: ${error.response?.statusCode}";
        case DioExceptionType.cancel:
          return "Request cancelled";
        case DioExceptionType.connectionError:
          return "Connection error";
        default:
          return "Something went wrong";
      }
    }
    return error.toString();
  }
}
