import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMesssage;

  const Failure(this.errorMesssage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMesssage);

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout With Api Server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout With Api Server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout in connection with Api Server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to Api Server was cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error With Api Server');
      case DioExceptionType.unknown:
        if (e.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unknown Error');
      default:
        return ServerFailure('Unknown Error');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your Request Not Found');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error');
    }
    return ServerFailure('Unknown Error');
  }
}
