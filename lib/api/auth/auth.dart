import 'package:dio/dio.dart';
import 'package:estimators/base/headers_endpoints.dart';
import 'package:estimators/models/auth/auth.dart';
import 'package:uuid/uuid.dart';

class AuthApi {
  Dio? dio;

  AuthApi({this.dio});

  Future<dynamic> signUp({SignUpRequest? signUpRequest}) async {
    Uuid uuid = Uuid();
    print("${signUpRequest!.toJson()}");
    try {
      Response res = await dio!.post(
        "/user/register",
        data: signUpRequest.toJson(),
        options: Options(headers: {
          "client-id": "application-client",
        }),
      );
      print(res.statusCode);

      return res.data;
    } catch (e) {
      var error = (e as DioError);
      print("ERROR ${error.message}");
    }
  }
}
