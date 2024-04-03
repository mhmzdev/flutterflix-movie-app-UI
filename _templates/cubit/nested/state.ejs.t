---
to: lib/cubits/<%= h.changeCase.snake(name) %>/state.dart
---
<% pascal = h.changeCase.pascal(name) %>
<% rootClass = h.changeCase.pascal(name)+"State" %>
part of 'cubit.dart';
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
<% props += "\tfinal "+baseClass+" "+state+";\n" %>
<% constructor += "required this."+state+",\n" %>
<% equatable += state+",\n" %>
<% copyWithArgs += baseClass+"? "+state+",\n" %>
<% copyWithBody += "\t\t\t\t"+state+": "+state+" ?? this."+state+",\n" %>
<% defaultConstuctor += state+": const "+baseClass+"(),\n" %>

// nested-states
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

@immutable
class <%= rootClass %> extends Equatable {
// root-state
<%= props %>

  const <%= rootClass %>({
    // root-state-constr
<%= constructor %>
  });

  @override
  List<Object> get props => [
    // root-state-props
<%= equatable %>
  ];

  <%= rootClass %> copyWith({
    // root-cw
<%= copyWithArgs %>
  }) {
    return <%= rootClass %>(
      // root-cw-ins
<%= copyWithBody %>
    );
  }
}

@immutable
class <%= rootClass %>Default extends <%= rootClass %> {
  const <%= rootClass %>Default()
      : super(
          // root-state-init
<%= defaultConstuctor %>
        );
}