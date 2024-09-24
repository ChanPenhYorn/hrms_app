import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class LocalStorageService {
  GetStorage box = GetStorage();

  Future<void> saveToken(String key, String value) async {
    await box.write(key, value);
  }

  Future<String?> getToken(String key) async {
    final token = box.read(key);

    return token;
  }

  Future<void> removeToken(String key) async {
    await box.remove(key);
    if (kDebugMode) {
      print("Token removed for key: $key");
    }
  }

  bool isTokenExpired(String token) {
    try {
      final jwt = JWT.decode(token);
      final exp = jwt.payload['exp'];
      if (exp is int) {
        final expiryTime = DateTime.fromMillisecondsSinceEpoch(exp * 1000);

        return DateTime.now().isAfter(expiryTime);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error decoding token: $e');
      }
    }
    return true;
  }
}
