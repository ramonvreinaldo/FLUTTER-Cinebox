import 'package:cinebox/config/env.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tmdb_rest_client.g.dart';

@Riverpod(keepAlive: true)
Dio tmdbRestClient(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      connectTimeout: const Duration(milliseconds: 50),
      receiveTimeout: const Duration(milliseconds: 50),
    ),
  );

  dio.options.headers = {
    'Content-Type': 'application/json',
  };
  dio.options.headers['Authorization'] =
      'Bearer ${Env.theMovieDbApiKey}'; // TMDB uses Bearer token for auth
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
