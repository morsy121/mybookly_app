import 'package:dio/dio.dart';
//import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final baseUrl = "https://www.googleapis.com/books/v1/";
  final Dio dio;
  ApiService(this.dio);

  Future<Map<String, dynamic>> get({
    required String endpoint,
  }) async {
    var response = await dio.get('$baseUrl$endpoint');
    return response.data;
  }
}


//     dio.interceptors.add(PrettyDioLogger());
// // customization
//     dio.interceptors.add(PrettyDioLogger(
//         requestHeader: true,
//         requestBody: true,
//         responseBody: true,
//         responseHeader: false,
//         error: true,
//         compact: true,
//         maxWidth: 90));