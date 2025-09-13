import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class ToastExamplePage extends StatelessWidget {
  const ToastExamplePage({super.key});

  static int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            PentaToastController.I.showText(
              options: PentaToastShowOptions(),
              text: 'Hello, world! ${++count}',
            );
          },
          child: Text('Show Toast'),
        ),
      ),
    );
  }
}
