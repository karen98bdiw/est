import 'package:dio/dio.dart';
import 'package:estimators/base/headers_endpoints.dart';
import 'package:estimators/models/additional_data/proffesions.dart';

class AditionalDataApi {
  final Dio? dio;

  AditionalDataApi({this.dio});

  Future<Proffesions> getAllProffesions() async {
    var res = await dio!.get(EstimateEndPoints.proffesions);
    return res.data;
  }
}
