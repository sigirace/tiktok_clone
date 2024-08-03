import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tictok_clone/features/inbox/models/message.dart';
import 'package:tictok_clone/features/inbox/repos/messages_repo.dart';

class MessageViewModel extends AsyncNotifier<void> {
  late final MessagesRepo _repo;

  @override
  FutureOr build() {
    _repo = ref.read(messagesRepo);
  }

  Future<void> sendMessage(String text) async {
    final user = ref.read(authRepo).user;
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 2));
    state = await AsyncValue.guard(() async {
      final message = MessageModel(
        text: text,
        userId: user!.uid,
      );
      _repo.sendMessage(message);
    });
  }
}

final messagesProvider = AsyncNotifierProvider<MessageViewModel, void>(
  () => MessageViewModel(),
);
