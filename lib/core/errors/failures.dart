import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  // ignore: deprecated_member_use
  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServere');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServere');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServere');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate with ApiServere');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiService canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Error Connection with ApiServere');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }

        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Something went wrong, Please try later!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later!');
    } else {
      return ServerFailure('Something went wrong, Please try later!');
    }
  }
}
