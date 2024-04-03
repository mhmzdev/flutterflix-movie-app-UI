part of '../news.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Screen(
      keyboardHandler: true,
      bottomBar: true,
      child: SafeArea(
        child: Center(
          child: Text(
            'Coming soon...!',
            style: AppText.b1 + AppTheme.c.grey,
          ),
        ),
      ),
    );
  }
}
