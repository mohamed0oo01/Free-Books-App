import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMassseg;

  Failure(this.errorMassseg);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMassseg);

  factory ServerFailure.fromDioError(DioError dioerror) {
    switch (dioerror.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure(' sendTimeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receiveTimeout with api server');
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponce(
          dioerror.response!.statusCode!,
          dioerror.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure('request to  api server canceled');

      case DioExceptionType.connectionError:
        return ServerFailure('check your internet connection');
      case DioExceptionType.unknown:
        if (dioerror.message!.contains("SocketException")) {
          return ServerFailure('no internet connecton');
        }
        return ServerFailure('unexcepted error');
      // default:
      //   return ServerFailure('zzzzzzzzzzzzzzzzzzzzzzzzzzz');
    }
  }
  factory ServerFailure.fromResponce(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['masseg']);
    } else if (statusCode == 404) {
      return ServerFailure('your request not found');
    } else if (statusCode == 500) {
      return ServerFailure('internal server error');
    } else {
      return ServerFailure('Opps thwre was an error');
    }
  }
}
