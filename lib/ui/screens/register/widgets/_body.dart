part of '../register.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    final authCubit = AuthCubit.c(context);

    return Screen(
      keyboardHandler: true,
      formKey: screenState.formKey,
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
              'Create Account',
              style: AppText.h3 + FontWeight.w700,
            ),
            Space.y.t60,
            AppInputField(
              label: 'Full Name',
              name: _FormKeys.fullName,
              prefixIcon: const Icon(Iconsax.user),
              hint: 'John Doe',
              validator: Validator.name(),
            ),
            Space.y.t25,
            const AppInputEmail(
              name: _FormKeys.email,
              label: 'Email',
            ),
            Space.y.t25,
            AppInputField(
              label: 'Enter password',
              name: _FormKeys.password,
              hint: '* * * * * *',
              passwordField: true,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: 'Password cannot be empty'),
                FormBuilderValidators.minLength(6,
                    errorText: 'Password must be 6 characters or more.')
              ]),
            ),
            Space.y.t25,
            AppInputField(
              label: 'Confirm password',
              name: _FormKeys.confirm,
              hint: '* * * * * *',
              passwordField: true,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: 'Confirm Password cannot be empty'),
                (String? value) {
                  if (value != null) {
                    final form = screenState.formKey.currentState!;
                    form.save();
                    final password = form.value[_FormKeys.password] as String?;

                    if (password != value) {
                      return 'Password mismatches, please try again!';
                    }

                    return null;
                  }
                  return null;
                }
              ]),
            ),
            Space.y.t30,
            AppButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                screenState.onSubmit(authCubit);
              },
              label: 'Register',
            ),
            Space.y.t30,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: AppText.s1,
                ),
                Space.x.t10,
                TouchableOpacity(
                  onTap: () => AppRoutes.login.pushReplace(context),
                  child: Text(
                    'Sign In',
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
