---
to: lib/ui/screens/<%= h.changeCase.snake(name) %>/_listener.dart
---
part of '<%= h.changeCase.snake(name) %>.dart';
<% cubit = h.changeCase.pascal(arg.cubit) %>
<% state = h.changeCase.pascal(arg.state) %>
<% stateL = h.changeCase.camel(arg.state) %>
<% module = h.changeCase.camel(arg.module) %>

class _Listener extends StatelessWidget {
  const _Listener();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer< <%= cubit %>Cubit, <%= cubit %>State>(
      listenWhen: <%= cubit %><%= state %>State.match,
      listener: (context, state) {
        //
      },
      builder: (context, state) {
        final loading = state.<%= stateL %> is <%= cubit %><%= state %>Loading;
        return FullScreenLoader(
          loading: loading,
        );
      },
    );
  }
}
