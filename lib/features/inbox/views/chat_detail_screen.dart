import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/features/inbox/view_models/messages_view_model.dart';

class ChatDetailScreen extends ConsumerStatefulWidget {
  static const String routeName = "chatDetail";
  static const String routeURL = ":chatId";
  final String chatId;

  const ChatDetailScreen({
    super.key,
    required this.chatId,
  });

  @override
  ChatDetailScreenState createState() => ChatDetailScreenState();
}

class ChatDetailScreenState extends ConsumerState<ChatDetailScreen> {
  final TextEditingController _editingController = TextEditingController();

  bool _isWriting = false;

  void _outFocus() {
    FocusScope.of(context).unfocus();
    _stopWriting();
  }

  void _stopWriting() {
    setState(() {
      _isWriting = false;
    });
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  void _onSendPress() {
    final text = _editingController.text;
    if (text == "") return;
    ref.read(messagesProvider.notifier).sendMessage(text, context);
    _editingController.text = "";
    _onStartWriting();
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(messagesProvider).isLoading;
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: Stack(
            children: [
              const CircleAvatar(
                radius: Sizes.size24,
                foregroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/31294995?v=4",
                ),
                child: Text(
                  "sigi",
                ),
              ),
              Positioned(
                right: -2,
                bottom: -2,
                child: Container(
                  width: Sizes.size18,
                  height: Sizes.size18,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(
                        Sizes.size10,
                      ),
                      border: Border.all(
                        color: Colors.white,
                        width: Sizes.size3,
                      )),
                ),
              )
            ],
          ),
          title: Text(
            "sigi ${widget.chatId}",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: const Text(
            "Active now",
          ),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
                size: Sizes.size20,
                color: Colors.black,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                size: Sizes.size20,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: _outFocus,
            child: ListView.separated(
              padding: const EdgeInsets.only(
                top: Sizes.size10,
                bottom: Sizes.size96,
                left: Sizes.size16,
                right: Sizes.size16,
              ),
              itemBuilder: (context, index) {
                final isMine = index % 2 == 0;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment:
                      isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(
                        Sizes.size24,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(
                            Sizes.size20,
                          ),
                          topRight: const Radius.circular(
                            Sizes.size20,
                          ),
                          bottomLeft: isMine
                              ? const Radius.circular(
                                  Sizes.size20,
                                )
                              : const Radius.circular(
                                  Sizes.size1,
                                ),
                          bottomRight: isMine
                              ? const Radius.circular(
                                  Sizes.size1,
                                )
                              : const Radius.circular(
                                  Sizes.size20,
                                ),
                        ),
                        color: isMine
                            ? Colors.blue
                            : Theme.of(context).primaryColor,
                      ),
                      child: const Text(
                        "this is a message.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.size16,
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => Gaps.v10,
              itemCount: 10,
            ),
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                bottom: 16,
                top: 16,
              ),
              child: Row(
                children: [
                  Gaps.h10,
                  Expanded(
                    child: SizedBox(
                      height: Sizes.size44,
                      child: TextField(
                        controller: _editingController,
                        onTap: _onStartWriting,
                        textInputAction: TextInputAction.newline,
                        minLines: null,
                        maxLines: null,
                        expands: true,
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                          hintText: "Add a comment...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              Sizes.size12,
                            ),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: Sizes.size10,
                            horizontal: Sizes.size10,
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(
                              right: Sizes.size14,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.at,
                                  color: Colors.grey.shade900,
                                ),
                                Gaps.h10,
                                FaIcon(
                                  FontAwesomeIcons.gift,
                                  color: Colors.grey.shade900,
                                ),
                                Gaps.h10,
                                FaIcon(
                                  FontAwesomeIcons.faceSmile,
                                  color: Colors.grey.shade900,
                                ),
                                Gaps.h10,
                                if (_isWriting)
                                  GestureDetector(
                                    onTap: isLoading ? null : _onSendPress,
                                    child: FaIcon(
                                      isLoading
                                          ? FontAwesomeIcons.spinner
                                          : FontAwesomeIcons.circleArrowUp,
                                      color: Colors.grey.shade900,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
