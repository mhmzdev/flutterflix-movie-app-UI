---
inject: true
to: lib/cubits/<%= h.changeCase.snake(name) %>/state.dart
after: // nested-states
---
<% pascal = h.changeCase.pascal(name) %>
<% rootClass = h.changeCase.pascal(name)+"State" %>
<%= props = "" %>
<%= constructor = "" %>
<%= equatable = "" %>
<%= copyWithArgs = "" %>
<%= copyWithBody = "" %>
<%= defaultConstuctor = "" %>

<% args.forEach(function(arg){ %>

<% module = h.changeCase.pascal(arg.module) %>
<% model = h.changeCase.pascal(arg.model) %>
<% state = h.changeCase.camel(arg.state) %>
<% moduleClass = pascal+module %>
<% baseClass = moduleClass+"State" %>
<% props += "\tfinal "+baseClass+" "+state+";" %>
<% constructor += "required this."+state+"," %>
<% equatable += state+",\n" %>
<% copyWithArgs += baseClass+"? "+state+"," %>
<% copyWithBody += "\t\t\t\t"+state+": "+state+" ?? this."+state+"," %>
<% defaultConstuctor += state+": const "+baseClass+"()," %>
@immutable
class <%= baseClass %> extends Equatable {
  static bool match(<%= rootClass %> a, <%= rootClass %> b) => a.<%= state %> != b.<%= state %>;

  final <%= model %>? data;
  final String? message;

  const <%= baseClass %>({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [data, message,];
}

@immutable
class <%= moduleClass %>Default extends <%= baseClass %> {}

@immutable
class <%= moduleClass %>Loading extends <%= baseClass %> {}

@immutable
class <%= moduleClass %>Success extends <%= baseClass %> {
  const <%= moduleClass %>Success({super.data});
}

@immutable
class <%= moduleClass %>Failed extends <%= baseClass %> {
  const <%= moduleClass %>Failed({super.message});
}
<% }); %>