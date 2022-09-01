import 'dart:io';

class ApiHeaders {
  ApiHeaders._();

  static const Map<String, String> defaultHeaders = <String, String>{
    HttpHeaders.contentTypeHeader: 'application/json',
  };
}
