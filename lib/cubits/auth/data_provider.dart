part of 'cubit.dart';

class _AuthProvider {
  static final firebase = FirebaseFirestore.instance;
  static final auth = FirebaseAuth.instance;
  static final users = firebase.collection(Collections.users);

  // data-ftns

  static Future<User> register(Map<String, dynamic> values) async {
    try {
      final email = values['email'];
      final password = values['password'];

      final result = (await auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      ))
          .user!;

      await users.doc(result.uid).set({
        ...values,
        'createdAt': DateTime.now().toIso8601String(),
      });

      return result;
    } on FirebaseAuthException catch (e) {
      throw Exception(FireAuth.exceptionMessage(e.code));
    } catch (e) {
      debugPrint('----- Register failed exception ----');
      debugPrint('----- $e -----');
      throw Exception('Failed to register, try again!');
    }
  }

  static Future<AuthData?> fetchUserProfile(String? uid) async {
    try {
      if (uid == null) return null;

      final user = await users.doc(uid).get();
      if (!user.exists) return null;

      return AuthData.fromJson(user.data()!);
    } catch (e) {
      debugPrint('------ AuthProvider Fetch User Profile ------');
      debugPrint('------ $e ------');
      throw Exception("Failed to fetch user profile!");
    }
  }

  static Future<User?> login(String email, String password) async {
    try {
      final result = (await auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      ))
          .user;

      return result;
    } on FirebaseAuthException catch (e) {
      throw Exception(FireAuth.exceptionMessage(e.code));
    } catch (e) {
      debugPrint('----- login failed exception ----');
      debugPrint('----- $e -----');
      throw Exception('Failed to login, try again!');
    }
  }
}
