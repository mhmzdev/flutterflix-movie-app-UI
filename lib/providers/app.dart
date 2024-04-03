import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppState extends ChangeNotifier {
  static AppState s(BuildContext context, [bool listen = false]) =>
      Provider.of<AppState>(context, listen: listen);
}
