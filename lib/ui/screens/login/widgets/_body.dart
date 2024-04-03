part of '../login.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.c(context);
    final screenState = _ScreenState.s(context, true);

    return Screen(
      keyboardHandler: true,
      formKey: screenState.formKey,
      initialFormValue: _FormData.initialValues(),
      overlayBuilders: const [_Listener()],
      child: SafeArea(
        child: ScrollColumnExpandable(
          padding: Space.a.t30,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                FlutterLogo(
                  size: 25.un(),
                ),
                Space.x.t10,
                Expanded(
                  child: Text(
                    'Flutterflix - Movies for Flutter Developers!',
                    style: AppText.b1,
                  ),
                )
              ],
            ),
            Space.y.t100,
            Text(
              'Sign In',
              style: AppText.h3 + FontWeight.w700,
            ),
            Space.y.t60,
            const AppInputEmail(
              name: _FormKeys.email,
              label: 'Email',
            ),
            Space.y.t20,
            AppInputField(
              label: 'Password',
              name: _FormKeys.password,
              passwordField: true,
              prefixIcon: const Icon(Iconsax.lock_1),
              hint: '* * * * * *',
              validator: FormBuilderValidators.required(
                  errorText: 'Password is required'),
            ),
            Space.y.t30,
            AppButton(
              onPressed: () {
                FocusScope.of(context);
                screenState.onSubmit(authCubit);
              },
              label: 'Login',
            ),
            Space.y.t30,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: AppText.s1,
                ),
                Space.x.t10,
                TouchableOpacity(
                  onTap: () => AppRoutes.register.pushReplace(context),
                  child: Text(
                    'Sign Up',
                    style:
                        AppText.s1 + FontWeight.w700 + TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
