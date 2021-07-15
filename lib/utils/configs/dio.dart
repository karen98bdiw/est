import 'package:dio/dio.dart';
import 'package:estimators/base/headers_endpoints.dart';
import 'package:estimators/base/keys.dart';
import 'package:flutter/material.dart';

class DioConfig {
  static Dio initDio() {
    var dio = Dio(BaseOptions(
      baseUrl: EstimateEndPoints.baseUrl,
      connectTimeout: 20000,
      receiveTimeout: 20000,
      validateStatus: (status) {
        print("STATUS $status");
        return true;
      },
    ));

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) =>
                requestInterceptor(options, handler),
        onResponse: (Response response, ResponseInterceptorHandler handler) =>
            responseInterceptor(response, handler),
        onError: (DioError dioError, ErrorInterceptorHandler handler) =>
            errorInterceptor(dioError, handler),
      ),
    );
    return dio;
  }

  static requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("------ DIO REQUEST i -----  ${options.uri} ");

    print(options.data);

    return handler.next(options);
  }

  static responseInterceptor(Response response, handler) {
    print("------ DIO RESPONSE -----  ${response.realUri} ");
    if (response.statusCode != 200) {
      showErrorDialog(
        response.data["message"],
      );
    }
    return handler.next(response);
  }

  static errorInterceptor(DioError dioError, handler) {
    print("dokepoikfoeifje");
    print('-------------- DIO ERROR ---------------');
    return handler.next(dioError.response);
  }
}

showErrorDialog(String text) {
  showDialog(
      context: navKey.currentContext!,
      builder: (c) {
        return AlertDialog(
          content: Container(
            width: 100,
            height: 200,
            child: Text(text),
          ),
        );
      });
}
