class ExceptionHandler implements Exception {
  final _message;
  final _prefix;

  ExceptionHandler([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends ExceptionHandler {
  FetchDataException([String message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends ExceptionHandler {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends ExceptionHandler {
  UnauthorisedException([message]) : super(message, "Unauthorized Request: ");
}

class NotFoundException extends ExceptionHandler {
  NotFoundException([message]) : super(message, "Request Link Not Found: ");
}

class ExcessiveRequestException extends ExceptionHandler {
  ExcessiveRequestException([message]) : super(message, "Excessive Requests: ");
}

class InternalServerException extends ExceptionHandler {
  InternalServerException([message]) : super(message, "Internal Server Error: ");
}

class ServiceUnavailableException extends ExceptionHandler {
  ServiceUnavailableException([message]) : super(message, "Service Unavailable: ");
}