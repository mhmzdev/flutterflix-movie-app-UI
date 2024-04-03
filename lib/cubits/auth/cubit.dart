import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflix/configs/configs.dart';
import 'package:flutterflix/models/auth/auth_data.dart';
import 'package:flutterflix/services/firebase/auth_exception.dart';
import 'package:flutterflix/services/firebase/collections.dart';

part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

part 'states/_fetch.dart';
part 'states/_init.dart';
part 'states/_login.dart';
part 'states/_logout.dart';
part 'states/_reigster.dart';

class AuthCubit extends Cubit<AuthState> {
  static AuthCubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<AuthCubit>(context, listen: listen);
  AuthCubit() : super(const AuthStateDefault());

  final repo = _AuthRepository();
  late StreamSubscription<User?> listener;

  void reset() => emit(const AuthStateDefault());

  @override
  Future<void> close() async {
    super.close();
    listener.cancel();
  }

  // cubit-ftns

  Future<void> register(Map<String, dynamic> values) async {
    emit(state.copyWith(
      register: AuthRegisterLoading(),
    ));
    try {
      final data = await _AuthProvider.register(values);

      final profile = await _AuthProvider.fetchUserProfile(data.uid);

      emit(state.copyWith(
        register: const AuthRegisterSuccess(),
        user: data,
        profile: profile,
      ));
    } catch (e) {
      emit(state.copyWith(
        register: AuthRegisterFailed(message: e.toString()),
      ));
    }
  }

  Future<void> init() async {
    emit(state.copyWith(
      init: AuthInitLoading(),
    ));
    listener = FirebaseAuth.instance.authStateChanges().listen((event) {
      _initUser(event);
      listener.cancel();
    });
  }

  Future<void> _initUser(User? user) async {
    try {
      final firebaseUser = user ?? FirebaseAuth.instance.currentUser;
      final profile = await _AuthProvider.fetchUserProfile(firebaseUser?.uid);

      emit(state.copyWith(
        user: firebaseUser,
        profile: profile,
        init: const AuthInitSuccess(),
      ));
    } catch (e) {
      await FirebaseAuth.instance.signOut();
      emit(state.copyWith(
        init: AuthInitFailed(message: e.toString()),
      ));
    }
  }

  Future<void> login(String email, String password) async {
    emit(state.copyWith(
      login: AuthLoginLoading(),
    ));
    try {
      final data = await _AuthProvider.login(email, password);
      final profile = await _AuthProvider.fetchUserProfile(data?.uid);

      emit(state.copyWith(
        login: const AuthLoginSuccess(),
        user: data,
        profile: profile,
      ));
    } catch (e) {
      emit(state.copyWith(
        login: AuthLoginFailed(message: e.toString()),
      ));
    }
  }

  Future<void> fetchProfile() async {
    emit(state.copyWith(
      fetchProfile: AuthFetchLoading(),
    ));
    try {
      final data = await _AuthProvider.fetchUserProfile(state.user?.uid);
      emit(state.copyWith(
        fetchProfile: const AuthFetchSuccess(),
        profile: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        fetchProfile: AuthFetchProfileFailed(message: e.toString()),
      ));
    }
  }

  Future<void> logout() async {
    emit(state.copyWith(
      logout: AuthLogoutLoading(),
    ));
    try {
      await FirebaseAuth.instance.signOut();
      emit(state.copyWith(
        logout: const AuthLogoutSuccess(),
        user: null,
        profile: null,
      ));

      /// Due to some reason, it cached the profile in state and bring it up even if new
      /// user signs up
      await 1.seconds.delay;
      reset();
    } catch (e) {
      emit(state.copyWith(
        logout: AuthLogoutFailed(message: e.toString()),
      ));
    }
  }
}
