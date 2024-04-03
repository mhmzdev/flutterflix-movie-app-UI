---
inject: true
to: lib/cubits/<%= h.changeCase.snake(name) %>/state.dart
after: // root-state-constr
---
<% args.forEach(function(arg){ %>
<%= constructor = "" %>
<% state = h.changeCase.camel(arg.state) %>
<% constructor += "required this."+state+"," %>
<%= constructor %>
<% }); %>