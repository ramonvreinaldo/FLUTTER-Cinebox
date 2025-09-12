import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/services/google_signin/google_signin_service.dart';
import 'package:cinebox/data/services/local_storage/local_storage_service.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final GoogleSigninService _googleSigninService;
  final LocalStorageService _localStorageService;

  AuthRepositoryImpl({
    required GoogleSigninService googleSigninService,
    required LocalStorageService localStorageService,
  }) : _googleSigninService = googleSigninService,
       _localStorageService = localStorageService;

  @override
  Future<Result<bool>> isLogged() async {
    final resultToken = await _localStorageService.getIdToken();

    return switch (resultToken) {
      Success<String>() => Success(true),
      Failure<String>() => Success(false),
    };
  }

  @override
  Future<Result<Unit>> signIn() async {
    final result = await _googleSigninService.signIn();
    switch (result) {
      case Success<String>(:final value):
        await _localStorageService.saveIdToken(value);
        return sucessOfUnit();
      case Failure<String>(:final error):
        log(
          'Google SignIn error',
          name: 'AuthRepository',
          error: error,
        );
        return Failure(
          DataException('Google SignIn error'),
        );
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    final result = await _googleSigninService.signOut();
    switch (result) {
      case Success<Unit>():
        final removeResult = await _localStorageService.removeIdToken();
        switch (removeResult) {
          case Success<Unit>():
            return sucessOfUnit();
          case Failure<Unit>(:final error):
            log(
              'Error removing id token from local storage',
              name: 'AuthRepository',
              error: error,
            );
            return Failure(error);
        }
      case Failure<Unit>(:final error):
        return Failure(error);
    }
  }
}
