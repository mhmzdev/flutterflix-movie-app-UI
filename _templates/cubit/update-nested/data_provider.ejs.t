---
inject: true
to: lib/cubits/<%= h.changeCase.snake(name) %>/data_provider.dart
after: // data-ftns
---
<% args.forEach(function(arg){ %>
  static Future<<%= h.changeCase.pascal(arg.model) %>> <%= h.changeCase.camel(arg.module) %>() async {
    try {
      final Map<String, dynamic> raw = {};
      return <%= h.changeCase.pascal(arg.model) %>.fromJson(raw);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
<% }); %>