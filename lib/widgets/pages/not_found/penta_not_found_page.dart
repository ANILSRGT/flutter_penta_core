import 'package:flutter/material.dart';

class PentaNotFoundPage extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? goBackWidget;
  final String notFoundText;
  final VoidCallback? goBack;
  const PentaNotFoundPage({
    super.key,
    this.appBar,
    this.goBackWidget,
    this.goBack,
    this.notFoundText = 'Not Found',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  text: '404',
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: ' $notFoundText',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: goBack != null,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: goBack ?? () => Navigator.pop(context),
                      child: goBackWidget ??
                          const Text(
                            'Go Back',
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
