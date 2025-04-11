import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';

class SecureStorage {
  static late Box _secureBox;
  static final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  static const String _encryptionKeyName = 'secureBoxKey';

  static Future<void> init() async {
    // Initialize Hive with the correct path
    await Hive.initFlutter(); // This is now called through hive_flutter package
    
    // Register adapters if you have any (optional)
    // Hive.registerAdapter(MyAdapter());
    
    await _openEncryptedBox();
  }

  static Future<void> _openEncryptedBox() async {
    final encryptionKey = await _getEncryptionKey();
    _secureBox = await Hive.openBox(
      'secureBox',
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }

  static Future<List<int>> _getEncryptionKey() async {
    var key = await _secureStorage.read(key: _encryptionKeyName);
    if (key == null) {
      final newKey = Hive.generateSecureKey();
      await _secureStorage.write(
        key: _encryptionKeyName,
        value: base64UrlEncode(newKey),
      );
      return newKey;
    }
    return base64Url.decode(key);
  }

  static Future<void> saveData(String key, String value) async {
    await _secureBox.put(key, value);
  }

  static String? getData(String key) {
    return _secureBox.get(key);
  }

  static Future<void> deleteData(String key) async {
    await _secureBox.delete(key);
  }

  static Future<void> deleteAllData() async {
    await _secureBox.clear();
    await _secureStorage.delete(key: _encryptionKeyName);
    await Hive.deleteBoxFromDisk('secureBox');
    await _openEncryptedBox(); // Reinitialize with new key
  }

  static List<String> getAllKeys() {
    return _secureBox.keys.cast<String>().toList();
  }
}