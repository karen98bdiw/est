import 'package:estimators/manager/auth/auth.dart';

class EstimateManager {
  EstimateManager._internale({this.authManager});

  final AuthManager? authManager;

  static EstimateManager? estimateManager;

  factory EstimateManager() {
    if (estimateManager == null) {
      estimateManager = EstimateManager._internale(
        authManager: AuthManager(),
      );
    }
    return estimateManager!;
  }
}
