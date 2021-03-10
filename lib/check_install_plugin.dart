import 'dart:async';

import 'package:flutter/services.dart';

class CheckInstallPlugin {
  static const MethodChannel _channel =
      const MethodChannel('check_install_plugin');

  static Future<bool> checkPackage(String packageName) async {
    final bool version = await _channel
        .invokeMethod('checkPackage', {'packageName': packageName});
    return version;
  }
}
