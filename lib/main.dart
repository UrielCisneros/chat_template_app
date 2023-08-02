import 'package:chat_template_app/providers/chat_provider.dart';
import 'package:chat_template_app/screens/Chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        title: 'Chat',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selecterColor: 2).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}
