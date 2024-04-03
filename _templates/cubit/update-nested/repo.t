---
inject: true
to: lib/cubits/<%= h.changeCase.snake(name) %>/repository.dart
after: // repo-ftns
---
<% args.forEach(function(arg){ %>
  Future< <%= h.changeCase.pascal(arg.model) %>> <%= h.changeCase.camel(arg.module) %>() => _<%= h.changeCase.pascal(name) %>Provider.<%= h.changeCase.camel(arg.module) %>();
<% }); %>