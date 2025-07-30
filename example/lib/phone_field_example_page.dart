import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

void main(List<String> args) {
  runApp(const PhoneFieldExamplePage());
}

class PhoneFieldExamplePage extends StatelessWidget {
  const PhoneFieldExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: PentaPhoneField(
              countryDisplay: PentaPhoneFieldCountryDisplayConfig(),
              phoneNumber: PentaPhoneFieldPhoneNumberConfig(),
            ),
          ),
        ),
      ),
    );
  }
}
