import 'package:flutter/services.dart';

class FlutterMethodChannel {
  static const platform =
      MethodChannel('com.example.flutter_structure_project');

  Future<bool?> welcome({
    required String message,
  }) async {
    try {
      bool? result = await platform.invokeMethod("welcome", [
        message,
      ]);
      return result;
    } catch (e) {
      return null;
    }
  }
}
