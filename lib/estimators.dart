import 'package:estimators/api/api.dart';
import 'package:estimators/base/keys.dart';
import 'package:estimators/manager/manager.dart';
import 'package:estimators/models/auth/auth.dart';
import 'package:estimators/ui/pages/auth/check_action_screen.dart';
import 'package:estimators/ui/pages/auth/register_screen.dart';
import 'package:flutter/material.dart';

class EstimatorsApp extends StatelessWidget {
  const EstimatorsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navKey,
      home: CheckActionScreen(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: TextButton(
          child: Text("REGISTER"),
          onPressed: () {
            EstimateManager()
                .authManager!
                .signUp(signUpRequest: SignUpRequest());
          },
        ),
      ),
    );
  }
}
