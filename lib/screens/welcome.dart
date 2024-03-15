import 'package:flutter/material.dart';
import 'package:flutter_structure_project/helpers/method_channel.dart';
import 'package:flutter_structure_project/widgets/w_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WTextContent(value: "Welcome!!"),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () async {
                FlutterMethodChannel().welcome(message: "Hello World");
              },
              child: WTextContent(
                value: "Click me",
              ))
        ],
      ),
    );
  }
}
