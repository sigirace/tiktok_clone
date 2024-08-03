import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tictok_clone/features/inbox/models/message.dart';
import 'package:tictok_clone/features/inbox/repos/messages_repo.dart';
import 'package:tictok_clone/utils.dart';

class MessageViewModel extends AsyncNotifier<void> {
  late final MessagesRepo _repo;

  @override
  FutureOr build() {
    _repo = ref.read(messagesRepo);
  }

  Future<void> sendMessage(String text, BuildContext context) async {
    final user = ref.read(authRepo).user;
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 1));
    state = await AsyncValue.guard(() async {
      final message = MessageModel(
        text: text,
        userId: user!.uid,
        createdAt: DateTime.now().microsecondsSinceEpoch,
      );
      _repo.sendMessage(message);
    });

    if (context.mounted && state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    }
  }
}

final messagesProvider = AsyncNotifierProvider<MessageViewModel, void>(
  () => MessageViewModel(),
);

final chatProvider = StreamProvider.autoDispose<List<MessageModel>>((ref) {
  // firestore 접근
  final db = FirebaseFirestore.instance;

  return db
      .collection("chat_rooms")
      .doc("ZtiBhYi98WbKsonVK79n")
      .collection("texts")
      .orderBy("createdAt")
      .snapshots()
      .map(
        (event) => event.docs
            .map(
              (doc) => MessageModel.fromJson(
                doc.data(),
              ),
            )
            .toList(),
      );
});
