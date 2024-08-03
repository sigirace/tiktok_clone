import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/features/inbox/models/message.dart';

class MessagesRepo {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> sendMessage(MessageModel message) async {
    await _db
        .collection("chat_rooms")
        .doc("ZtiBhYi98WbKsonVK79n")
        .collection("text")
        .add(
          message.toJson(),
        );
  }
}

final messagesRepo = Provider((ref) => MessagesRepo());
