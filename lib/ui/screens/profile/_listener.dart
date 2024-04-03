part of 'profile.dart';

class _Listener extends StatelessWidget {
  const _Listener();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: AuthLogoutState.match,
      listener: (context, state) {
        if (state.logout is AuthLogoutSuccess) {
          AppRoutes.login.pushReplace(context);
          AppToast.success(context, 'You have been logged out!');
        }

        if (state.logout is AuthLogoutFailed) {
          final error = state.logout.message!.split(': ').last;
          AppToast.error(context, error);
        }
      },
      builder: (context, state) {
        final loading = state.logout is AuthLogoutLoading;
        return FullScreenLoader(
          loading: loading,
        );
      },
    );
  }
}
