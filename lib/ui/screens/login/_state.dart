part of 'login.dart';

class _ScreenState extends ChangeNotifier {
  // ignore: unused_element
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  final formKey = GlobalKey<FormBuilderState>();

  void onSubmit(AuthCubit authCubit) {
    final form = formKey.currentState!;
    final isValid = form.saveAndValidate();
    if (!isValid) return;

    final data = form.value;
    final email = data[_FormKeys.email] as String;
    final password = data[_FormKeys.password] as String;
    authCubit.login(email, password);
  }
}
