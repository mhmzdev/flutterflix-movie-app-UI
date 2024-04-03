---
inject: true
to: lib/cubits/<%= h.changeCase.snake(name) %>/state.dart
after: // root-cw
---
<% pascal = h.changeCase.pascal(name) %>
<%= copyWithArgs = "" %>
<%= copyWithBody = "" %>
<% args.forEach(function(arg){ %>
<% module = h.changeCase.pascal(arg.module) %>
<% state = h.changeCase.camel(arg.state) %>
<% moduleClass = pascal+module %>
<% baseClass = moduleClass+"State" %>
<% copyWithArgs += baseClass+"? "+state+"," %>
<% copyWithBody += "\t\t\t\t"+state+": "+state+" ?? this."+state+"," %>
<% }); %>
<%= copyWithArgs %>