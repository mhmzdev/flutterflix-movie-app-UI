---
inject: true
to: lib/cubits/<%= h.changeCase.snake(name) %>/state.dart
after: // root-state-init
---
<% args.forEach(function(arg){ %>
<%= defaultConstuctor = "" %>
<% module = h.changeCase.pascal(arg.module) %>
<% state = h.changeCase.camel(arg.state) %>
<% moduleClass = pascal+module %>
<% baseClass = moduleClass+"State" %>
<% defaultConstuctor += state+": const "+baseClass+"()," %>
<%= defaultConstuctor %>
<% }); %>