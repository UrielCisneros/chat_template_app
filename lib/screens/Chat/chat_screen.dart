import 'package:chat_template_app/domain/entities/message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_template_app/providers/chat_provider.dart';
import 'package:chat_template_app/screens/widgets/her_chat_message.dart';
import 'package:chat_template_app/screens/widgets/message_field_box.dart';
import 'package:chat_template_app/screens/widgets/my_chat_message.dart';
// import 'package:chat_template_app/screens/widgets/my_chat_message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jennifer Lawrence"),
        centerTitle: false,
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://d26oc3sg82pgk3.cloudfront.net/files/media/edit/image/11295/article_aligned%401x.png"),
          ),
        ),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: chatProvider.messagesList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messagesList[index];

                      return (message.fromWho == FromWho.me)
                          ? const MyMessageChat()
                          : const HerChatMessage();
                    })),
            const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}
