import 'package:assignment/utils/app_utils.dart';
import 'package:dio/dio.dart';

class DioConfig {
  DioConfig._();

  static final instance = DioConfig._();

  BaseOptions options = BaseOptions(
    connectTimeout: AppUtils.connectionTimeout,
    receiveTimeout: AppUtils.receiveTimeout,
    responseType: ResponseType.json,
  );

  Dio dio = Dio();

  Dio getInstance() {
    dio.interceptors.add(QueuedInterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }));
    dio.options = options;
    return dio;
  }
}