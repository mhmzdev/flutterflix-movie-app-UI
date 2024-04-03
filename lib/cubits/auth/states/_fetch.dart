part of '../cubit.dart';

@immutable
class AuthFetchState extends Equatable {
  static bool match(AuthState a, AuthState b) =>
      a.fetchProfile != b.fetchProfile;

  final String? message;

  const AuthFetchState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

@immutable
class AuthFetchDefault extends AuthFetchState {}

@immutable
class AuthFetchLoading extends AuthFetchState {}

@immutable
class AuthFetchSuccess extends AuthFetchState {
  const AuthFetchSuccess() : super();
}

@immutable
class AuthFetchProfileFailed extends AuthFetchState {
  const AuthFetchProfileFailed({super.message});
}
