part of 'login.dart';

class _Listener extends StatelessWidget {
  const _Listener();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: AuthLoginState.match,
      listener: (context, state) {
        if (state.login is AuthLoginSuccess) {
          AppRoutes.home.pushReplace(context);
        }

        if (state.login is AuthLoginFailed) {
          final message = state.login.message!.split(': ').last;
          AppToast.error(context, message);
        }
      },
      builder: (context, state) {
        final loading = state.login is AuthLoginLoading;
        return FullScreenLoader(
          loading: loading,
        );
      },
    );
  }
}
