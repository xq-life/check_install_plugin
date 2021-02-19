
import 'dart:async';

import 'package:flutter/services.dart';

class CheckInstallPlugin {
  static const MethodChannel _channel =
      const MethodChannel('check_install_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
