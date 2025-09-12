import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:cinebox/core/result/result.dart';
import 'package:google_sign_in/google_sign_in.dart';

import './google_signin_service.dart';

class GoogleSigninServiceImpl implements GoogleSigninService {
  @override
  Future<Result<String>> isSignedIn() async {
    try {
      final logged = await GoogleSignIn.instance.attemptLightweightAuthentication();

      if (logged case GoogleSignInAccount(
        authentication: GoogleSignInAuthentication(:final idToken?),
      )) {
        return Success(idToken);
      }
      return Failure(Exception('No user is currently signed in'));
    } catch (e, s) {
      log(
        'Error checking if user is signed in',
        name: 'GoogleSignInService',
        error: e,
        stackTrace: s,
      );
      return Failure(Exception('Error checking if user is signed in'));
    }
  }

  @override
  Future<Result<String>> signIn() async {
    try {
      final auth = await GoogleSignIn.instance.authenticate(
        scopeHint: ['email', 'profile', 'openid'],
      );

      if (auth.authentication case GoogleSignInAuthentication(idToken: final idToken?)) {
        return Success(idToken);
      }
      return Failure(Exception('Failed to sign in with Google'));
    } catch (e, s) {
      log(
        'Error during Google sign-in',
        name: 'GoogleSignInService',
        error: e,
        stackTrace: s,
      );
      return Failure(Exception('Error during Google sign-in'));
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    try {
      await GoogleSignIn.instance.signOut();
      return sucessOfUnit();
    } on Exception catch (e, s) {
      log(
        'Error during Google sign-out',
        name: 'GoogleSignInService',
        error: e,
        stackTrace: s,
      );
      return Failure(Exception('Error during Google sign-out'));
    }
  }
}
