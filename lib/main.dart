import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const EmojiGeneratorApp());
}

class EmojiGeneratorApp extends StatelessWidget {
  const EmojiGeneratorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emoji Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EmojiGeneratorPage(),
    );
  }
}

class EmojiGeneratorPage extends StatefulWidget {
  const EmojiGeneratorPage({Key? key}) : super(key: key);

  @override
  State<EmojiGeneratorPage> createState() => _EmojiGeneratorPageState();
}

class _EmojiGeneratorPageState extends State<EmojiGeneratorPage> {
  final List<String> emojis = ['😀', '😂', '🥰', '😎', '🤔', '😭', '🎉', '🌟', '🔥', '🍕'];
  String currentEmoji = '😀';
  Color backgroundColor = Colors.white;

  void generateEmoji() {
    final random = Random();
    setState(() {
      currentEmoji = emojis[random.nextInt(emojis.length)];
      backgroundColor = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Emoji Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                currentEmoji,
                key: ValueKey<String>(currentEmoji),
                style: const TextStyle(fontSize: 100),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateEmoji,
              child: const Text('Generate Emoji'),
            ),
          ],
        ),
      ),
    );
  }
}
