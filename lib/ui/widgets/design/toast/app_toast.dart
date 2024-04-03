import 'package:flutter/material.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutterflix/configs/configs.dart';

class AppToast {
  static void error(BuildContext context, String message) async {
    return context.showErrorBar(
      content: Text(message),
      indicatorColor: AppTheme.c.error,
      duration: 5.seconds,
      icon: Icon(
        Icons.info,
        color: AppTheme.c.error,
      ),
    );
  }

  static void success(BuildContext context, String message) async {
    return context.showSuccessBar(
      content: Text(message),
      duration: 5.seconds,
      indicatorColor: AppTheme.c.success,
      icon: Icon(
        Icons.check_circle,
        color: AppTheme.c.success,
      ),
    );
  }
}
