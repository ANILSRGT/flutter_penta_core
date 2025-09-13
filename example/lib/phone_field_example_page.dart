import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class PhoneFieldExamplePage extends StatelessWidget {
  const PhoneFieldExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: PentaPhoneField(
            countryDisplay: PentaPhoneFieldCountryDisplayConfig(),
            phoneNumber: PentaPhoneFieldPhoneNumberConfig(),
          ),
        ),
      ),
    );
  }
}
