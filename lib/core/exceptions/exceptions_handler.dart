import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

mixin ExceptionsHandler {
  String? handleException(Object object) {
    String? message;
    debugPrint(object.toString());

    if (object is DioError) {
      final response = object.response;
      if (response != null) {
        //TODO handle server error message
        return message;
      }
    } else {
      return message;
    }
  }
}
