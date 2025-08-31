import 'package:cinebox/core/result/result.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import './local_storage_service.dart';

class LocalStorageServiceImpl implements LocalStorageService {
  final FlutterSecureStorage _fluterSecureStorage;

  LocalStorageServiceImpl({required FlutterSecureStorage flutterSecureStorage})
    : _fluterSecureStorage = flutterSecureStorage;

  @override
  Future<Result<String>> getIdToken() async {
    final token = await _fluterSecureStorage.read(key: 'id_token');

    if (token == null) {
      return Failure(Exception('No token found'));
    }

    return Success(token);
  }

  @override
  Future<Result<Unit>> removeIdToken() async {
    await _fluterSecureStorage.delete(key: 'id_token');
    return sucessOfUnit();
  }

  @override
  Future<Result<Unit>> saveIdToken(String token) async {
    _fluterSecureStorage.write(key: 'id_token', value: token);
    return sucessOfUnit();
  }
}
