import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class PhoneFieldExamplePage extends StatefulWidget {
  const PhoneFieldExamplePage({super.key});

  @override
  State<PhoneFieldExamplePage> createState() => _PhoneFieldExamplePageState();
}

class _PhoneFieldExamplePageState extends State<PhoneFieldExamplePage> {
  String _status = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phone field')),
      body: SafeArea(
        child: Padding(
          padding: AppValues.lg.ext.padding.all,
          child: Column(
            children: [
              PentaPhoneField(
                languageCode: 'tr',
                initialValue: PentaPhoneFieldCountryCodesEnum.turkey,
                phoneNumber: const PentaPhoneFieldPhoneNumberConfig(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                callbacks: PentaPhoneFieldCallbacks(
                  onValidPhoneNumber: (full, _, _) =>
                      setState(() => _status = 'Valid: $full'),
                  onInvalidPhoneNumber: (_, error) =>
                      setState(() => _status = error ?? ''),
                ),
              ),
              AppValues.lg.ext.gap,
              const PentaPhoneField(
                selection: PentaPhoneFieldCountrySelectionConfig(
                  selectionType: PentaPhoneFieldSelectionType.bottomSheet,
                  bottomSheetTitle: 'Select country',
                ),
                countryDisplay: PentaPhoneFieldCountryDisplayConfig(
                  displayType: PentaPhoneFieldDisplayType.flagOnly,
                ),
              ),
              AppValues.lg.ext.gap,
              const PentaPhoneField(
                selection: PentaPhoneFieldCountrySelectionConfig(
                  selectionType: PentaPhoneFieldSelectionType.dropdown,
                ),
              ),
              AppValues.lg.ext.gap,
              Text(_status),
            ],
          ),
        ),
      ),
    );
  }
}
