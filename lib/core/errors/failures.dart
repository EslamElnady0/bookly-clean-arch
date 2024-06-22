import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: "Request to API server was cancelled");
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: "Connection timeout with API server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            errMessage: "Receive timeout in connection with API server");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            statusCode: dioException.response!.statusCode!,
            response: dioException.response!.data);
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            errMessage: "Send timeout in connection with API server");
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: "No internet connection");

      case DioExceptionType.unknown:
        return ServerFailure(errMessage: "Unexpected error occurred");
      default:
        return ServerFailure(errMessage: "Something went wrong");
    }
  }
  factory ServerFailure.fromResponse(
      {required int statusCode, required dynamic response}) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: response["error"]['message']);
    } else if (statusCode == 404) {
      return ServerFailure(errMessage: "Not found");
    } else if (statusCode == 500) {
      return ServerFailure(errMessage: "Internal server error");
    } else {
      return ServerFailure(errMessage: "Something went wrong");
    }
  }
}
