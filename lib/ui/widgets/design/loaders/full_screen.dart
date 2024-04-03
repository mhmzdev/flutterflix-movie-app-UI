import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutterflix/configs/configs.dart';

class FullScreenLoader extends StatelessWidget {
  final bool loading;
  final Color? color;
  const FullScreenLoader({
    super.key,
    this.loading = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (!loading) {
      return const SizedBox();
    }
    return AbsorbPointer(
      absorbing: loading,
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: CircularProgressIndicator(
              color: color ?? AppTheme.c.primary,
            ),
          ),
        ),
      ),
    );
  }
}
