import 'dart:io';

class ExceptionRequestFailed extends HttpException {
  final int statusCode;

  ExceptionRequestFailed(super.message, this.statusCode);
}