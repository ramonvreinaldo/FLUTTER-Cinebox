import 'package:cinebox/config/env.dart';
import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/services/services_providers.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'backend_rest_client.g.dart';

class BackendAuthInterceptor extends Interceptor {
  final Ref ref;

  BackendAuthInterceptor({required this.ref});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final localStorage = ref.read(localStorageServiceProvider);
    final idTokenResult = await localStorage.getIdToken();
    if (idTokenResult case Success(value: final idToken)) {
      options.headers['Authorization'] = 'Bearer $idToken';
    }
    handler.next(options);
  }
}

@Riverpod(keepAlive: true)
Dio backendRestClient(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: Env.backApiUrl,
      connectTimeout: const Duration(milliseconds: 50),
      receiveTimeout: const Duration(milliseconds: 50),
    ),
  );

  dio.options.headers = {
    'X-Parse-Application-Id': Env.backAppId,
    'X-Parse-Client-Key': Env.backClientKey,
    'Content-Type': 'application/json',
  };
  dio.interceptors.addAll(
    [
      LogInterceptor(
        request: true,
        requestHeader: true,
        responseBody: true,
        requestBody: true,
        error: true,
      ),
    ],
  );

  return dio;
}
