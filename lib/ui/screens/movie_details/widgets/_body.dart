part of '../movie_details.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    final movie = screenState.movie;

    return Screen(
      keyboardHandler: true,
      child: SafeArea(
        child: ScrollColumnExpandable(
          padding: Space.a.t30,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButton(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Iconsax.search_normal,
                    size: 8.un(),
                  ),
                )
              ],
            ),
            Space.y.t20,
            Image.asset(
              movie.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Space.y.t20,
            Text(
              movie.title.titleCase,
              style: AppText.h2,
            ),
            Space.y.t10,
            Row(
              children: [
                Text(
                  '2021',
                  style: AppText.s1,
                ),
                Space.x.t30,
                Text(
                  '1h 37m',
                  style: AppText.s1,
                ),
                Space.x.t30,
                Icon(
                  Iconsax.messages,
                  size: 8.un(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}