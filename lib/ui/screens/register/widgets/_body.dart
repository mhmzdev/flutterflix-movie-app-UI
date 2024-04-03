part of '../register.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);

    return Screen(
      keyboardHandler: true,
      formKey: screenState.formKey,
      initialFormValue: _FormData.initialValues(),
      child: const SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //
          ],
        ),
      ),
    );
  }
}
