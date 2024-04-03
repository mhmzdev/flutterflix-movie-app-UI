part of '../cubit.dart';

@immutable
class AuthInitState extends Equatable {
  static bool match(AuthState a, AuthState b) => a.init != b.init;

  final String? message;

  const AuthInitState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

@immutable
class AuthInitDefault extends AuthInitState {}

@immutable
class AuthInitLoading extends AuthInitState {}

@immutable
class AuthInitSuccess extends AuthInitState {
  const AuthInitSuccess() : super();
}

@immutable
class AuthInitFailed extends AuthInitState {
  const AuthInitFailed({super.message});
}
