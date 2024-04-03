---
inject: true
to: lib/cubits/<%= h.changeCase.snake(name) %>/state.dart
after: // root-state-props
---
<% args.forEach(function(arg){ %>
<% state = h.changeCase.camel(arg.state) %>
<%= state %>,
<% }); %>