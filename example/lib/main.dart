import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:check_install_plugin/check_install_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isInstall;

  //待检测应用的包名
  String _packageName = 'com.tencent.mm';

  @override
  void initState() {
    super.initState();
    checkApplicationInstall();
  }

  Future<void> checkApplicationInstall() async {
    bool isInstall;
    try {
      isInstall = await CheckInstallPlugin.checkPackage(_packageName);
    } catch (e) {
      isInstall = true;
    }
    if (mounted) {
      setState(() {
        _isInstall = isInstall;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Plugin example app')),
        body: Center(
          child: Text('$_packageName is install: $_isInstall'),
        ),
      ),
    );
  }
}
