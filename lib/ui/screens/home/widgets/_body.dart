part of '../home.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Screen(
      keyboardHandler: true,
      bottomBar: true,
      child: SafeArea(
        child: ScrollColumnExpandable(
          padding: Space.a.t30,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlutterLogo(
                  size: 15.un(),
                ),
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
            Row(
              children: [
                'TV Shows',
                'Movies',
                'Animations',
              ].map((cat) {
                return Padding(
                  padding: Space.r.t15,
                  child: Chip(
                    label: Text(cat),
                  ),
                );
              }).toList(),
            ),
            Space.y.t30,
            _List(
              title: 'Popular on Flutterflix',
              movies: movies,
            ),
            Space.y.t30,
            _List(
              title: 'Trending Now',
              movies: movies,
            ),
            Space.y.t30,
            _List(
              title: 'Top Picks for You',
              movies: movies,
            ),
            Space.y.t30,
            _List(
              title: 'Recently Added',
              movies: movies,
            ),
          ],
        ),
      ),
    );
  }
}
