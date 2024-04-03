part of '../profile.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final auth = AuthCubit.c(context);
    final profile = auth.state.profile!;

    final letterFirst = profile.fullName.split(' ').first[0];
    final letterSecond = profile.fullName.split(' ').last[0];
    final name = '$letterFirst$letterSecond';

    return Screen(
      bottomBar: true,
      keyboardHandler: true,
      overlayBuilders: const [_Listener()],
      child: SafeArea(
        child: ScrollColumnExpandable(
          padding: Space.a.t30,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  'My Flutterflix',
                  style: AppText.h3 + FontWeight.w600,
                ),
                Space.xm,
                IconButton(
                  icon: const Icon(Iconsax.search_normal),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Iconsax.logout,
                    color: AppTheme.c.primary,
                  ),
                  onPressed: () => auth.logout(),
                ),
              ],
            ),
            Space.y.t30,
            CircleAvatar(
              radius: 20.un(),
              backgroundColor: AppTheme.c.primaryDark,
              child: Text(
                name,
                style: AppText.h1 + Colors.white,
              ),
            ),
            Space.y.t20,
            Text(
              profile.fullName,
              style: AppText.b1 + FontWeight.w600,
            ),
            Space.y.t05,
            Text(
              profile.email,
              style: AppText.b3 + AppTheme.c.grey,
            ),
            Space.y.t60,
          ],
        ),
      ),
    );
  }
}
