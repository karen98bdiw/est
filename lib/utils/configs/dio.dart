import 'package:dio/dio.dart';
import 'package:estimators/base/headers_endpoints.dart';
import 'package:flutter/material.dart';

class DioConfig {
  static Dio initDio() {
    var dio = Dio(BaseOptions(
      baseUrl: EstimateEndPoints.baseUrl,
      connectTimeout: 20000,
      receiveTimeout: 20000,
      validateStatus: (status) {
        return false;
      },
    ));

    // dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onRequest:
    //         (RequestOptions options, RequestInterceptorHandler handler) =>
    //             requestInterceptor(options, handler),
    //     onResponse: (Response response, ResponseInterceptorHandler handler) =>
    //         responseInterceptor(response),
    //     onError: (DioError dioError, ErrorInterceptorHandler handler) =>
    //         errorInterceptor(dioError),
    //   ),
    // );
    return dio;
  }

  static requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("------ DIO REQUEST -----  ${options.uri} ");

    print(options.data);

    // if (options.headers.containsKey(TMInterceptorHeaders.requiresToken)) {
    //   //remove the auxiliary requiresToken header
    //   options.headers.remove(TMInterceptorHeaders.requiresToken);
    //   options.headers.addAll({
    //     TMHeaders.authorization:
    //         await TMManager.secureStorage.read(key: 'token')
    //   });
    // }
    // if (options.headers.containsKey(TMInterceptorHeaders.requiresGameCode)) {
    //   //remove the auxiliary requiresGameCode header
    //   options.headers.remove(TMInterceptorHeaders.requiresGameCode);
    //   options.headers.addAll({TMHeaders.gameCode: TMManager().event.eventCode});
    // }
    // if (options.headers.containsKey(TMInterceptorHeaders.requiresEventId)) {
    //   //remove the auxiliary requiresEventId header
    //   options.headers.remove(TMInterceptorHeaders.requiresEventId);
    //   options.headers.addAll({TMHeaders.eventId: TMManager().event.eventId});
    // }

    // print('Headers are ${options.headers}');
    return options;
  }

  static responseInterceptor(Response response) {
    print("------ DIO RESPONSE -----  ${response.realUri} ");
    if (response.statusCode == 400 ||
        response.statusCode == 401 ||
        response.statusCode == 404) {
      String errorMessage;
      print(response.data['message'].runtimeType);
      if (response.data['message'].runtimeType.toString() == 'List<dynamic>') {
        errorMessage = (response.data['message'] as List).first;
      } else {
        errorMessage = response.data['message'];
      }

      return response;
    }
  }

  static errorInterceptor(DioError dioError) {
    print("dokepoikfoeifje");
    print('-------------- DIO ERROR ---------------');
    print(
        'dioError.request.uri ${dioError.requestOptions.uri}  dioError.request.data ${dioError.requestOptions.data}');
    print(dioError
        .message); //SocketException: OS Error: Connection refused, errno = 61, address = 67.205.188.198, port = 49822
    print('_RESPONSE');
    print(dioError.response);

    // if (dioError.type == DioErrorType.RECEIVE_TIMEOUT ||
    //     dioError.type == DioErrorType.CONNECT_TIMEOUT) {
    //   return Response(data: {
    //     'success': false,
    //     'message': 'You have an error with connection.'
    //   });
    // }

    return dioError.response;
  }
}
