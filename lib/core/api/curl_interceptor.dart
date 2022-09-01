import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class CurlInterceptor extends Interceptor {
  CurlInterceptor({this.printOnSuccess, this.convertFormData = true});

  final bool? printOnSuccess;
  final bool convertFormData;

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _renderCurlRepresentation(err.requestOptions);
    return handler.next(err);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (printOnSuccess != null && printOnSuccess == true) {
      _renderCurlRepresentation(response.requestOptions);
    }
    return handler.next(response);
  }

  void _renderCurlRepresentation(RequestOptions requestOptions) {
    try {
      log(_cURLRepresentation(requestOptions));
    } catch (err) {
      log(
        'unable to create a CURL representation of the requestOptions',
      );
    }
  }

  String _cURLRepresentation(RequestOptions options) {
    final List<String> components = <String>['curl -i'];
    if (options.method.toUpperCase() != 'GET') {
      components.add('-X ${options.method}');
    }

    options.headers.forEach((String k, dynamic v) {
      if (k != 'Cookie') {
        components.add('-H "$k: $v"');
      }
    });

    if (options.data != null) {
      if (options.data is FormData && convertFormData == true) {
        options.data = Map<dynamic, dynamic>.fromEntries(options.data.fields);
      }

      final String data = json.encode(options.data);
      components.add('-d "$data"');
    }

    components.add('"${options.uri.toString()}"');
    return components.join(' \\\n\t');
  }
}
