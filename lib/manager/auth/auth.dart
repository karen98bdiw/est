import 'package:estimators/api/api.dart';
import 'package:estimators/models/auth/auth.dart';

class AuthManager {
  Future<dynamic> signUp({SignUpRequest? signUpRequest}) async {
    var res =
        await EstimatorsApi().authApi!.signUp(signUpRequest: signUpRequest);
  }
}
