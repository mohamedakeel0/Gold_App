import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://gold-golio.herokuapp.com/",
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> Postdata({required String url,  Map<String,dynamic>? query, required Map<String, dynamic> data,}) async {
    return await dio.post(
      url,data: data,
      queryParameters: query,
    );
  }
}
