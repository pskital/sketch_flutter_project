import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

mixin ErrorHandler {
  String? handleError(Object object) {
    String? message;
    debugPrint(object.toString());

    if (object is DioError) {
      final response = object.response;
      if (response != null) {
        //TODO handle server error message
        return message;
      }
    }
    return null;
  }
}
