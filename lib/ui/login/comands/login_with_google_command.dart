import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/repositories/repositories_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_with_google_command.g.dart';

@riverpod
class LoginWithGoogleCommand extends _$LoginWithGoogleCommand {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> execute() async {
    state = const AsyncLoading();
    final authRepository = ref.read(authRepositoryProviderProvider);

    final result = await authRepository.signIn();

    switch (result) {
      case Success<Unit>():
        state = const AsyncData(null);
      case Failure<Unit>():
        state = AsyncError(
          'Login with Google failed',
          StackTrace.current,
        );
    }
  }
}
