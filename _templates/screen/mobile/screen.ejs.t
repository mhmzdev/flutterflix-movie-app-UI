---
to: lib/ui/screens/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart
---
import 'package:flutterflix/configs/configs.dart';
import 'package:flutterflix/ui/widgets/core/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
<% if (formData) { %>
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/foundation.dart';
<% } %>

part '_state.dart';

<% if (formData) { %>part 'static/_form_data.dart';<% } %>
<% if (formData) { %>part 'static/_form_keys.dart';<% } %>

part 'widgets/_body.dart';
<% if (widgets.length) { widgets.forEach(function(key){ %>part 'widgets/_<%=h.changeCase.snake(key)%>.dart';<% }); } %>

class <%=h.changeCase.pascal(name)%>Screen extends StatelessWidget {
  const <%=h.changeCase.pascal(name)%>Screen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
