import 'package:dio/dio.dart';
import 'package:estimators/api/auth/auth.dart';

class EstimatorsApi {
  EstimatorsApi._internal({this.authApi});

  AuthApi? authApi;

  static EstimatorsApi? estimatorsApi;

  factory EstimatorsApi({Dio? dio}) {
    if (estimatorsApi == null) {
      estimatorsApi = EstimatorsApi._internal(
        authApi: AuthApi(dio: dio),
      );
    }
    return estimatorsApi!;
  }
}
