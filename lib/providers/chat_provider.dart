import 'package:chat_template_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messagesList = [
    Message(text: "Hola", fromWho: FromWho.me),
    Message(text: "Holaaa", fromWho: FromWho.hers)
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);
    notifyListeners();
  }
}
