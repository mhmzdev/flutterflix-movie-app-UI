---
to: lib/ui/screens/<%= h.changeCase.snake(name) %>/widgets/_body.dart
---
part of '../<%= h.changeCase.snake(name) %>.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
     <% if (formData) { %>
    final screenState = _ScreenState.s(context, true);
     <% } %>

    return <%= !formData ? 'const' : '' %> Screen(
      keyboardHandler: true,
      <% if (formData) { %>
      formKey: screenState.formKey,
      initialFormValue: _FormData.initialValues(),
      <% } %>
      child: <%= formData ? 'const' : '' %> SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //
          ],
        ),
      ),
    );
  }
}
