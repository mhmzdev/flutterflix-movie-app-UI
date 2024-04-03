part of 'register.dart';

class _Listener extends StatelessWidget {
  const _Listener();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: AuthRegisterState.match,
      listener: (context, state) {
        if (state.register is AuthRegisterSuccess) {
          AppRoutes.home.pushReplace(context);
          AppToast.success(context, 'You have been registered successfully!');
        }

        if (state.register is AuthRegisterFailed) {
          final error = state.register.message!.split(': ').last;
          AppToast.error(context, error);
        }
      },
      builder: (context, state) {
        final loading = state.register is AuthRegisterLoading;
        return FullScreenLoader(
          loading: loading,
        );
      },
    );
  }
}
