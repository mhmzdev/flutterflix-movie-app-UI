---
inject: true
to: lib/cubits/<%= h.changeCase.snake(name) %>/state.dart
after: // root-state
---
<% pascal = h.changeCase.pascal(name) %>
<% args.forEach(function(arg){ %>
<%= props = "" %>
<% module = h.changeCase.pascal(arg.module) %>
<% state = h.changeCase.camel(arg.state) %>
<% moduleClass = pascal+module %>
<% baseClass = moduleClass+"State" %>
<% props += "\tfinal "+baseClass+" "+state+";" %>
<%= props %>
<% }); %>