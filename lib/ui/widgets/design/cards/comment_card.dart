import 'package:flutter/material.dart';
import 'package:flutterflix/configs/configs.dart';
import 'package:flutterflix/cubits/auth/cubit.dart';
import 'package:flutterflix/models/movie/comment.dart';
import 'package:iconsax/iconsax.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;
  final VoidCallback onHide;
  const CommentCard({
    super.key,
    required this.comment,
    required this.onHide,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final auth = AuthCubit.c(context);
    final profile = auth.state.profile!;

    final isAuthor = profile.uid == comment.uid;
    final hidden = isAuthor && !comment.visible;

    return Padding(
      padding: Space.v.t10,
      child: Row(
        children: [
          CircleAvatar(
            radius: 5.un(),
            backgroundColor: hidden ? AppTheme.c.grey : AppTheme.c.primaryDark,
            child: Text(
              comment.comment[0].titleCase,
              style: AppText.s1 + Colors.white,
            ),
          ),
          Space.x.t20,
          Expanded(
            child: Text(
              hidden ? 'Comment has been hidden' : comment.comment,
              style: AppText.b3.copyWith(
                fontStyle: hidden ? FontStyle.italic : FontStyle.normal,
                color: hidden ? AppTheme.c.grey : null,
              ),
            ),
          ),
          if (isAuthor)
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    onTap: onHide,
                    child: Text(hidden ? 'Undo' : 'Hide'),
                  )
                ];
              },
              child: Icon(
                Iconsax.more,
                size: 8.un(),
              ),
            )
        ],
      ),
    );
  }
}
