import 'package:chat_template_app/config/helpers/get_yes_and_not_answer.dart';
import 'package:chat_template_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesAndNoAnswer getYesAndNoAnswer = GetYesAndNoAnswer();

  List<Message> messagesList = [
    Message(text: "Hola", fromWho: FromWho.me),
    Message(text: "Holaaa", fromWho: FromWho.hers)
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    if (text.endsWith('?')) {
      herReply();
    }
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);
    moveScrollToBottom();
    notifyListeners();
  }

  Future<void> herReply() async {
    final herMessage = await getYesAndNoAnswer.getAnswer();
    messagesList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(microseconds: 200));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(microseconds: 300),
        curve: Curves.easeOut);
  }
}
