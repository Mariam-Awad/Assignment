import 'dart:convert';
import 'package:assignment/network/parser.dart';
import 'package:assignment/utils/app_debug_prints.dart';
import 'package:dio/dio.dart';

class NetworkManager {
  late Dio dio;
  CancelToken? cancelToken;

  Map<String, dynamic> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  NetworkManager({this.cancelToken}) {
    dio = Dio();
    dio.options = BaseOptions(headers: headers);
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      request: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: false,
    ));
  }

  void _updateHeaders() {
    String token =
        "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMWVhNzk1ZTliMGQ3NmVhYWVmMzc2YzkyOTMwZmMyNyIsInN1YiI6IjY1ODE5OGExZGY4NmE4MDhkYWU4YmY1ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Ih7bBtxfCpvmwmGOJp_yYiCmgjWqNMExtgac6NnGeSg";
    headers['Authorization'] = "Bearer $token";
  }

  Future<T?> get<T>(String url, {Map<String, dynamic>? params}) async {
    _updateHeaders();
    printDone(headers);
    if (params == null) params = {};
    printDone(params);

    Response response = await dio.get(url,
        queryParameters: params,
        cancelToken: cancelToken,
        options: Options(headers: headers));
    printDone(response.statusCode.toString());
    printDone("*************");

    return parseResponse<T>(response);
  }

  Future<List<T>?> getList<T>(String url,
      {Map<String, dynamic>? params, bool? needToken}) async {
    if (needToken != null && needToken) _updateHeaders();
    if (params == null) params = {};

    Response response = await dio.get(url,
        queryParameters: params,
        cancelToken: cancelToken,
        options: Options(headers: headers));
    return parseListResponse<T>(response);
  }

  Future<T?> post<T>(String url, {Map<String, dynamic>? body}) async {
    _updateHeaders();
    if (body == null) body = {};
    printDone(body);

    var formData = json.encode(body);
    Response response = await dio.post(url,
        cancelToken: cancelToken,
        options: Options(headers: headers),
        data: formData);
    printDone('response.statusCode ${response.statusCode}');
    return parseResponse<T>(response);
  }

  Future<T?> put<T>(String url, {Map<String, dynamic>? body}) async {
    _updateHeaders();
    if (body == null) body = {};
    printDone(body);

    var formData = json.encode(body);
    Response response = await dio.put(url,
        cancelToken: cancelToken,
        options: Options(headers: headers),
        data: formData);
    printDone('response.statusCode ${response.runtimeType}');
    printWarning('IN Put $response');
    return parseResponse<T>(response);
  }

  Future<Response> postString(String url, String body) async {
    _updateHeaders();

    Response response = await dio.post(url,
        cancelToken: cancelToken,
        options: Options(headers: headers),
        data: body);

    return response;
  }

  Future<T?> patch<T>(String url, {Map<String, dynamic>? body}) async {
    _updateHeaders();
    if (body == null) body = {};

    Response response = await dio.patch(url,
        queryParameters: body,
        cancelToken: cancelToken,
        options: Options(headers: headers));

    return parseResponse<T>(response);
  }

  Future<T?> delete<T>(String url, {Map<String, dynamic>? params}) async {
    _updateHeaders();
    if (params == null) params = {};

    Response response = await dio.delete(url,
        queryParameters: params,
        cancelToken: cancelToken,
        options: Options(headers: headers));

    return parseResponse<T>(response);
  }

  T? parseResponse<T>(Response response) {
    if (response.statusCode != 200) return null;
    var map;
    if (T == null || T == dynamic) {
      printDone('IN If Condition');
      return response.data;
    } else {
      map = response.data;
      printDone('MAP IS: $map');
    }

    return Parser.parse<T>(map);
  }

  List<T>? parseListResponse<T>(Response response) {
    if (response.statusCode != 200) return null;

    var map;
    if (T == null || T == dynamic) {
      return response.data;
    } else {
      map = response.data;
    }

    List<T> list = [];

    (map as List).forEach((m) {
      list.add(Parser.parse<T>(m));
    });

    return list;
  }
}
