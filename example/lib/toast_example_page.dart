import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class ToastExamplePage extends StatelessWidget {
  const ToastExamplePage({super.key});

  static int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Toast')),
      body: Center(
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => PentaToastController.I.showText(
                text: 'Hello, world! ${++count}',
              ),
              child: const Text('Queue a toast'),
            ),
            for (final position in PentaToastPosition.values)
              OutlinedButton(
                onPressed: () => PentaToastController.I.showText(
                  text: position.name,
                  options: PentaToastShowOptions(
                    dismissAll: true,
                    config: const PentaToastConfig().copyWith(
                      position: position,
                    ),
                  ),
                ),
                child: Text(position.name),
              ),
            ElevatedButton(
              onPressed: PentaToastController.I.dismissAll,
              child: const Text('Dismiss all'),
            ),
          ],
        ),
      ),
    );
  }
}
