import 'package:dio/dio.dart';

abstract class Fauilers {
  final String errMessage;

  Fauilers(this.errMessage);
}

class ServerFauiler extends Fauilers {
  ServerFauiler(super.errMessage);

  factory ServerFauiler.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFauiler('Connection Timeout with Api Server');
      case DioExceptionType.sendTimeout:
        return ServerFauiler('Send Timeout with Api Server');
      case DioExceptionType.receiveTimeout:
        return ServerFauiler('Receive Timeout with Api Server');
      case DioExceptionType.badCertificate:
        return ServerFauiler('Bad Certificate Error with Api Server');
      case DioExceptionType.badResponse:
        return ServerFauiler.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFauiler('Request Cancelled');
      case DioExceptionType.connectionError:
        return ServerFauiler('Connection Error with Api Server');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFauiler('No Internet Connection');
        }
        return ServerFauiler('Unknown Error');
    }
  }

  factory ServerFauiler.fromResponse(int statysCode, dynamic response) {
    if (statysCode == 400 || statysCode == 401 || statysCode == 403) {
      return ServerFauiler(response['error']['message']);
    } else if (statysCode == 404) {
      return ServerFauiler('Your requset not found, please try again');
    } else if (statysCode == 500) {
      return ServerFauiler('Internal Server Error, please try again later');
    } else {
      return ServerFauiler('Oops! Something went wrong');
    }
  }
}
