import 'dart:io';

class RequestFailedException extends HttpException {
  final int statusCode;

  RequestFailedException(super.message, this.statusCode);
}