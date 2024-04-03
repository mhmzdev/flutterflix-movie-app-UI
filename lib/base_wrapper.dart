import 'package:flutter/material.dart';

class BaseWrapper extends StatefulWidget {
  final Widget child;
  const BaseWrapper({super.key, required this.child});

  @override
  State<BaseWrapper> createState() => _BaseWrapperState();
}

class _BaseWrapperState extends State<BaseWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: widget.child);
  }
}
