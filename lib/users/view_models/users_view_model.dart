import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/users/models/users_profile_model.dart';
import 'package:tictok_clone/users/repos/user_repo.dart';

class UsersViewModel extends AsyncNotifier<UserProfileModel> {
  late final UserRepository _repository;

  @override
  FutureOr<UserProfileModel> build() {
    _repository = ref.read(userRepo);
    return UserProfileModel.empty();
  }

  Future<void> createProfile(UserCredential credential) async {
    if (credential.user == null) {
      throw Exception("Account not created");
    }

    state = const AsyncValue.loading();

    final profile = UserProfileModel(
      bio: "undifined",
      link: "undifiend",
      email: credential.user!.email ?? "ano@ano.com",
      uid: credential.user!.uid,
      name: credential.user!.displayName ?? "Anonymous",
    );

    await _repository.createProfile(profile);
    state = AsyncValue.data(
      profile,
    );
  }
}

final usersProvider = AsyncNotifierProvider<UsersViewModel, UserProfileModel>(
  () => UsersViewModel(),
);
