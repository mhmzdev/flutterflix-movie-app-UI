---
inject: true
to: lib/router/router.dart
after: // imports
skip_if: import 'package:flutterflix/ui/screens/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart';
---
import 'package:flutterflix/ui/screens/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart';