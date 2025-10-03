import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioExeption(DioException dioExeption) {
    switch (dioExeption.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection time out with ApiServer");

      case DioExceptionType.sendTimeout:
        return ServerFailure("Send Time out with ApiServer");

      case DioExceptionType.receiveTimeout:
        return ServerFailure("Recive Time out with ApiServer");

      case DioExceptionType.badCertificate:
        return ServerFailure("Bad certificate with ApiServer");

      case DioExceptionType.badResponse:
        return ServerFailure.fromRespose(
          dioExeption.response!.statusCode!,
          dioExeption.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure("Request to ApiServer was canceld");

      case DioExceptionType.connectionError:
        return ServerFailure("Connection Error with ApiServer");

      case DioExceptionType.unknown:
        if (dioExeption.message!.contains('SocketException !')) {
          return ServerFailure('No Internet connection !');
        }
        //!       if (dioExeption.message?.contains('SocketException') == true) {
        //!   return ServerFailure('No Internet connection !');
        //!}
        return ServerFailure("UnExpected Error , Plesase tryy again later !");
      //! default:
      //! return ServerFailure('Opps there was an erroe , please try again');
    }
  }

  factory ServerFailure.fromRespose(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found , please try later !');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Servaer Error , please try later !');
    } else {
      return ServerFailure('Opps there was an erroe , please try again');
    }
  }
}
