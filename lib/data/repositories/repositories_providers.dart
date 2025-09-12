import 'package:cinebox/data/repositories/auth/auth_repository.dart';
import 'package:cinebox/data/repositories/auth/auth_repository_impl.dart';
import 'package:cinebox/data/services/services_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repositories_providers.g.dart';

@riverpod
AuthRepository authRepositoryProvider(Ref ref) {
  return AuthRepositoryImpl(
    googleSigninService: ref.read(googleSignInServiceProvider),
    localStorageService: ref.read(localStorageServiceProvider),
  );
}
