---
inject: true
before: part
to: lib/ui/screens/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart
skip_if: <%= h.changeCase.snake(arg.cubit) %>/cubit.dart
---
import 'package:flutterflix/cubits/<%= h.changeCase.snake(arg.cubit) %>/cubit.dart';