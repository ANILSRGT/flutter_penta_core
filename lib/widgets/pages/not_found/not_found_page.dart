import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? goBackWidget;
  final VoidCallback? goBack;
  const NotFoundPage({super.key, this.appBar, this.goBackWidget, this.goBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RichText(
                text: const TextSpan(
                  text: '404',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: ' Not Found',
                      style: TextStyle(
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
