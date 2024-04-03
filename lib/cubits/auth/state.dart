part of 'cubit.dart';

// nested-states

@immutable
class AuthState extends Equatable {
  // root-state

  final AuthRegisterState register;
  final AuthInitState init;
  final AuthLoginState login;
  final AuthLogoutState logout;
  final AuthFetchState fetchProfile;
  final AuthData? profile;
  final User? user;

  const AuthState({
    // root-state-constr

    required this.register,
    required this.login,
    required this.init,
    required this.logout,
    required this.fetchProfile,
    this.profile,
    this.user,
  });

  @override
  List<Object?> get props => [
        // root-state-props

        register,
        login,
        logout,
        fetchProfile,
        profile,
        user,
      ];

  AuthState copyWith({
    // root-cw

    AuthRegisterState? register,
    AuthLoginState? login,
    AuthInitState? init,
    AuthLogoutState? logout,
    AuthFetchState? fetchProfile,
    AuthData? profile,
    User? user,
  }) {
    return AuthState(
      // root-cw-ins

      register: register ?? this.register,
      login: login ?? this.login,
      init: init ?? this.init,
      logout: logout ?? this.logout,
      fetchProfile: fetchProfile ?? this.fetchProfile,
      profile: profile ?? this.profile,
      user: user ?? this.user,
    );
  }
}

@immutable
class AuthStateDefault extends AuthState {
  const AuthStateDefault()
      : super(
          // root-state-init

          register: const AuthRegisterState(),
          init: const AuthInitState(),
          login: const AuthLoginState(),
          logout: const AuthLogoutState(),
          fetchProfile: const AuthFetchState(),
        );
}
