import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioAccessTokenInterceptor extends Interceptor {
  DioAccessTokenInterceptor();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    var token = dotenv.env['API_KEY'];

    options.headers.addAll({
      'X-Access-Token': token,
    });

    return handler.next(options);
  }
}
