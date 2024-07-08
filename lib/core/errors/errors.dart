import 'package:dio/dio.dart';

abstract class Fauiler {
  final String message;
  const Fauiler(this.message);
}

class ServerFauiler extends Fauiler {
  ServerFauiler(super.message);

  factory ServerFauiler.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFauiler('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFauiler('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFauiler('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFauiler.fromResponse(
            dioException.response!.statusCode, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFauiler('Request to ApiServer was canceld');

      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFauiler('No Internet Connection');
        }
        return ServerFauiler('Unexpected Error, Please try again!');
      default:
        return ServerFauiler('Opps There was an Error, Please try again');
    }
  }

  factory ServerFauiler.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFauiler(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFauiler('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFauiler('Internal Server error, Please try later');
    } else {
      return ServerFauiler('Opps There was an Error, Please try again');
    }
  }
}
