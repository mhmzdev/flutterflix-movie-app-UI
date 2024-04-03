part of 'movie_details.dart';

class _ScreenState extends ChangeNotifier {
  _ScreenState({required Map<String, dynamic> args}) {
    movie = args['movie'] as Movie;
  }

  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  final formKey = GlobalKey<FormBuilderState>();

  late Movie movie;

  void hideComment(Comment comment) {
    final comments = movie.comments;
    final index = comments.indexOf(comment);
    comments[index] = comment.copyWith(visible: !comment.visible);
    notifyListeners();
  }

  void comment(BuildContext context) {
    final form = formKey.currentState!;
    form.save();

    final comment = form.value[_FormKeys.comment] as String?;
    if (comment == null || comment.isEmpty) return;

    FocusScope.of(context).unfocus();

    final auth = AuthCubit.c(context);
    final profile = auth.state.profile!;

    final value = Comment(
      uid: profile.uid,
      comment: comment,
    );

    movie.comments.add(value);
    form.reset();
    AppToast.success(context, 'Comment has been posted!');
  }
}
