import 'package:bloc_prectice/config/constants/constants.dart';

class AppException implements Exception {
  String message;
  AppException({required this.message});
}

class NoInternetException extends AppException {
  NoInternetException() : super(message: kNoInternetMsg);
}

class ServerException extends AppException {
  ServerException() : super(message: kServiceErrorMsg);
}

class PermissionException extends AppException {
  PermissionException() : super(message: kPermissionDenied);
}

class SessionExpireException extends AppException {
  SessionExpireException() : super(message: kSessionExpireMsg);
}

class PoorNetworkException extends AppException {
  PoorNetworkException() : super(message: kPoorInternetConnection);
}

class NetworkException extends AppException {
  NetworkException() : super(message: kNetworkError);
}

class RequestTimeOutException extends AppException {
  RequestTimeOutException() : super(message: kRequestTimeOutMSG);
}

class UnknownException extends AppException {
  UnknownException() : super(message: kErrorMessage);
}
