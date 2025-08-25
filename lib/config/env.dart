import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(
    varName: 'GOOGLE_API_KEY',
    obfuscate: true,
  )
  static final String googleApiKey = _Env.googleApiKey;

  @EnviedField(varName: 'BACK_API_URL')
  static const String backApiUrl = _Env.backApiUrl;

  @EnviedField(
    varName: 'BACK_APP_ID',
    obfuscate: true,
  )
  static final String backAppId = _Env.backAppId;

  @EnviedField(
    varName: 'BACK_CLIENT_KEY',
    obfuscate: true,
  )
  static final String backClientKey = _Env.backClientKey;

  @EnviedField(
    varName: 'THE_MOVIE_DB_API_KEY',
    obfuscate: true,
  )
  static final String theMovieDbApiKey = _Env.theMovieDbApiKey;
}
