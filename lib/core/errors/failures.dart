import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  const Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: 'Connection timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: 'Send timeout');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: 'Receive timeout');

      case DioExceptionType.badCertificate:
        return ServerFailure(message: 'Bad certificate');

      case DioExceptionType.badResponse:
        return ServerFailure(message: 'Bad response');

      case DioExceptionType.cancel:
        return ServerFailure(message: 'Request cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure(message: 'Connection error');
      case DioExceptionType.unknown:
        return ServerFailure(message: 'Unknown error');
      
      default:
        return ServerFailure(message: 'Unknown error');
    }
  }
}
