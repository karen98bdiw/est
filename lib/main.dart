import 'package:dio/dio.dart';
import 'package:estimators/api/api.dart';
import 'package:estimators/estimators.dart';
import 'package:estimators/utils/configs/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dotenv/dotenv.dart' as env;

Future<void> run() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  env.load('.config');
  Dio dio = DioConfig.initDio();
  EstimatorsApi(dio: dio);
  runApp(EstimatorsApp());
}

void main() async {
  await run();
}
