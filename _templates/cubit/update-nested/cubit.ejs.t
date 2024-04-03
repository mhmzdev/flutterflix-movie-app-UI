---
inject: true
to: lib/cubits/<%= h.changeCase.snake(name) %>/cubit.dart
after: // cubit-ftns
---
<% pascal = h.changeCase.pascal(name) %>

<% args.forEach(function(arg){ %>
<% baseClass = pascal+h.changeCase.pascal(arg.module) %>
  Future<void> <%= h.changeCase.camel(arg.module) %>() async {
    emit(state.copyWith(
      <%= h.changeCase.camel(arg.state) %>: <%= baseClass %>Loading(),
    ));
    try {
      final data = await repo.<%= h.changeCase.camel(arg.module) %>();
      emit(state.copyWith(
        <%= h.changeCase.camel(arg.state) %>: <%= baseClass %>Success(data: data),
      ));
    } catch (e) {
      emit(state.copyWith(
        <%= h.changeCase.camel(arg.state) %>: <%= baseClass %>Failed(message: e.toString()),
      ));
    }
  }
<% }); %>