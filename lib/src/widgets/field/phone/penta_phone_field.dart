import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'penta_phone_field_country_codes_enum.dart';
part 'penta_phone_field_phone_info.dart';
part 'penta_phone_field_phone_list.dart';
part 'penta_phone_field_enums.dart';
part 'penta_phone_field_configs.dart';
part 'lang/phone_field_strings.dart';
part 'lang/phone_field_language_helper.dart';

part 'lang/ar_sa.dart';
part 'lang/bn_bd.dart';
part 'lang/de_de.dart';
part 'lang/el_gr.dart';
part 'lang/en_gb.dart';
part 'lang/es_es.dart';
part 'lang/fa_ir.dart';
part 'lang/fr_fr.dart';
part 'lang/hi_in.dart';
part 'lang/id_id.dart';
part 'lang/it_it.dart';
part 'lang/ja_jp.dart';
part 'lang/ko_kr.dart';
part 'lang/nl_nl.dart';
part 'lang/pl_pl.dart';
part 'lang/pt_pt.dart';
part 'lang/ru_ru.dart';
part 'lang/sv_se.dart';
part 'lang/th_th.dart';
part 'lang/tr_tr.dart';
part 'lang/uk_ua.dart';
part 'lang/ur_pk.dart';
part 'lang/vi_vn.dart';
part 'lang/zh_cn.dart';

/// International phone number input: a country selector next to a number
/// field.
///
/// ```dart
/// PentaPhoneField(
///   languageCode: 'tr',
///   initialValue: PentaPhoneFieldCountryCodesEnum.turkey,
///   callbacks: PentaPhoneFieldCallbacks(
///     onValidPhoneNumber: (full, country, info) => print(full), // +905551234567
///   ),
/// )
/// ```
///
/// When [initialValue] is null the country is detected from the app locale.
class PentaPhoneField extends StatefulWidget {
  const PentaPhoneField({
    super.key,
    this.languageCode = 'en',
    this.strings,
    this.initialValue,
    this.initialPhoneNumber,
    this.enabled = true,
    this.readOnly = false,
    this.layout = const PentaPhoneFieldLayoutConfig(),
    this.countryDisplay = const PentaPhoneFieldCountryDisplayConfig(),
    this.phoneNumber = const PentaPhoneFieldPhoneNumberConfig(),
    this.selection = const PentaPhoneFieldCountrySelectionConfig(),
    this.callbacks = const PentaPhoneFieldCallbacks(),
  });

  /// Language of country names and built-in texts (`tr`, `en`, `de`...).
  final String languageCode;

  /// Overrides the built-in texts.
  final PentaPhoneFieldStrings? strings;

  /// Initially selected country.
  final PentaPhoneFieldCountryCodesEnum? initialValue;

  /// Initial national number. Ignored when a controller is given.
  final String? initialPhoneNumber;
  final bool enabled;
  final bool readOnly;
  final PentaPhoneFieldLayoutConfig layout;
  final PentaPhoneFieldCountryDisplayConfig countryDisplay;
  final PentaPhoneFieldPhoneNumberConfig phoneNumber;
  final PentaPhoneFieldCountrySelectionConfig selection;
  final PentaPhoneFieldCallbacks callbacks;

  @override
  State<PentaPhoneField> createState() => _PentaPhoneFieldState();
}

class _PentaPhoneFieldState extends State<PentaPhoneField> {
  final GlobalKey _selectorKey = GlobalKey();
  late Map<PentaPhoneFieldCountryCodesEnum, PentaPhoneFieldPhoneInfo>
  _phoneList;
  PentaPhoneFieldCountryCodesEnum? _selected;
  TextEditingController? _ownedController;

  TextEditingController get _controller =>
      widget.phoneNumber.controller ??
      (_ownedController ??= TextEditingController(
        text: widget.initialPhoneNumber ?? '',
      ));

  PentaPhoneFieldStrings get _strings =>
      widget.strings ?? PentaPhoneFieldStrings.of(widget.languageCode);

  bool get _interactive => widget.enabled && !widget.readOnly;

  PentaPhoneFieldPhoneInfo? get _selectedInfo =>
      _selected == null ? null : _phoneList[_selected];

  @override
  void initState() {
    super.initState();
    _phoneList = PhoneList.phoneList(languageCode: widget.languageCode);
    _selected = widget.initialValue;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selected ??= _detectDefaultCountry();
  }

  @override
  void didUpdateWidget(covariant PentaPhoneField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.languageCode != widget.languageCode) {
      _phoneList = PhoneList.phoneList(languageCode: widget.languageCode);
    }
    if (oldWidget.initialValue != widget.initialValue &&
        widget.initialValue != null) {
      _selected = widget.initialValue;
    }
    if (oldWidget.phoneNumber.controller != widget.phoneNumber.controller &&
        widget.phoneNumber.controller != null) {
      _ownedController?.dispose();
      _ownedController = null;
    }
  }

  @override
  void dispose() {
    _ownedController?.dispose();
    super.dispose();
  }

  PentaPhoneFieldCountryCodesEnum _detectDefaultCountry() {
    final locale = Localizations.maybeLocaleOf(context);
    return PentaPhoneFieldCountryCodesEnum.fromIsoCode(locale?.countryCode) ??
        PentaPhoneFieldCountryCodesEnum.values.first;
  }

  // ------------------------------------------------------------ validation

  String? _lengthError(String number) {
    final info = _selectedInfo;
    if (info == null || number.isEmpty) return null;
    if (number.length < info.minLength || number.length > info.maxLength) {
      return _strings.lengthError(info.minLength, info.maxLength);
    }
    return null;
  }

  String? _validator(String? value) {
    final number = value?.trim() ?? '';
    return _lengthError(number) ?? widget.phoneNumber.validator?.call(value);
  }

  void _notifyValidation() {
    final info = _selectedInfo;
    if (info == null) return;
    final number = _controller.text.trim();
    if (number.isEmpty) return;

    final error = _validator(number);
    if (error != null) {
      widget.callbacks.onInvalidPhoneNumber?.call(number, error);
      return;
    }
    widget.callbacks.onValidPhoneNumber?.call(
      '${info.dialCode}$number',
      _selected!,
      info,
    );
  }

  // ---------------------------------------------------------------- events

  void _onCountryChanged(PentaPhoneFieldCountryCodesEnum country) {
    setState(() => _selected = country);
    widget.callbacks.onCountryChanged?.call(country, _phoneList[country]!);
    _notifyValidation();
  }

  void _onPhoneNumberChanged(String number) {
    widget.phoneNumber.onChanged?.call(number);
    widget.callbacks.onPhoneNumberChanged?.call(number);
    _notifyValidation();
  }

  Future<void> _openSelection() async {
    if (!_interactive) return;
    widget.callbacks.onSelectionOpened?.call();

    final selected = switch (widget.selection.selectionType) {
      PentaPhoneFieldSelectionType.dialog => await _showDialog(),
      PentaPhoneFieldSelectionType.bottomSheet => await _showBottomSheet(),
      PentaPhoneFieldSelectionType.dropdown => await _showDropdown(),
      PentaPhoneFieldSelectionType.custom => null,
    };

    if (!mounted) return;
    if (selected != null) _onCountryChanged(selected);
    widget.callbacks.onSelectionClosed?.call();
  }

  _CountryPicker _picker(BuildContext context, {String? title}) =>
      _CountryPicker(
        phoneList: _phoneList,
        selected: _selected,
        strings: _strings,
        selection: widget.selection,
        title: title,
        onSelected: (country) => Navigator.of(context).pop(country),
      );

  Future<PentaPhoneFieldCountryCodesEnum?> _showDialog() {
    final selection = widget.selection;
    return showDialog<PentaPhoneFieldCountryCodesEnum>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(selection.dialogTitle ?? _strings.selectCountry),
        shape: selection.dialogShape,
        contentPadding:
            selection.dialogContentPadding ?? const EdgeInsets.all(16),
        content: SizedBox(
          width: double.maxFinite,
          height: 400,
          child: _picker(context),
        ),
      ),
    );
  }

  Future<PentaPhoneFieldCountryCodesEnum?> _showBottomSheet() {
    final selection = widget.selection;
    return showModalBottomSheet<PentaPhoneFieldCountryCodesEnum>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: selection.bottomSheetShape,
      builder: (context) => Padding(
        padding:
            (selection.bottomSheetContentPadding ?? const EdgeInsets.all(16))
                .add(
                  EdgeInsets.only(
                    bottom: MediaQuery.viewInsetsOf(context).bottom,
                  ),
                ),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * .6,
          child: _picker(context, title: selection.bottomSheetTitle),
        ),
      ),
    );
  }

  Future<PentaPhoneFieldCountryCodesEnum?> _showDropdown() {
    final box = _selectorKey.currentContext?.findRenderObject() as RenderBox?;
    final overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox?;
    if (box == null || overlay == null) return Future.value();

    final topLeft = box.localToGlobal(
      Offset(0, box.size.height),
      ancestor: overlay,
    );
    final selection = widget.selection;
    return showMenu<PentaPhoneFieldCountryCodesEnum>(
      context: context,
      position: RelativeRect.fromRect(
        topLeft & Size(box.size.width, 0),
        Offset.zero & overlay.size,
      ),
      constraints: BoxConstraints(
        maxHeight: selection.dropdownMaxHeight ?? 320,
      ),
      initialValue: _selected,
      items: [
        for (final MapEntry(key: country, value: info) in _phoneList.entries)
          PopupMenuItem(
            value: country,
            height: selection.dropdownItemHeight ?? kMinInteractiveDimension,
            child: Text('${info.flag}  ${info.dialCode}  ${info.countryName}'),
          ),
      ],
    );
  }

  // --------------------------------------------------------------- widgets

  Widget _buildCountryDisplay(BuildContext context) {
    final info = _selectedInfo;
    if (info == null) return const SizedBox.shrink();

    final display = widget.countryDisplay;
    if (display.customBuilder != null) {
      return display.customBuilder!(context, info, false);
    }

    final theme = Theme.of(context);
    final radius = BorderRadius.circular(display.borderRadius ?? 8);
    final textStyle = display.textStyle ?? theme.textTheme.bodyLarge;
    final flag = Text(info.flag, style: const TextStyle(fontSize: 20));
    final dial = Text(info.dialCode, style: textStyle);
    final name = Flexible(
      child: Text(
        info.countryName,
        style: textStyle,
        overflow: TextOverflow.ellipsis,
      ),
    );
    const gap = SizedBox(width: 8);

    final content = switch (display.displayType) {
      PentaPhoneFieldDisplayType.flagOnly => [
        Text(info.flag, style: const TextStyle(fontSize: 24)),
      ],
      PentaPhoneFieldDisplayType.dialCodeOnly => [dial],
      PentaPhoneFieldDisplayType.countryNameOnly => [name],
      PentaPhoneFieldDisplayType.flagAndDialCode => [flag, gap, dial],
      PentaPhoneFieldDisplayType.flagAndCountryName => [flag, gap, name],
      PentaPhoneFieldDisplayType.dialCodeAndCountryName => [dial, gap, name],
      PentaPhoneFieldDisplayType.flagDialCodeAndCountryName => [
        flag,
        gap,
        dial,
        gap,
        name,
      ],
      PentaPhoneFieldDisplayType.custom => const <Widget>[],
    };

    return Container(
      width: display.width,
      height: display.height,
      margin: display.margin,
      decoration: BoxDecoration(
        border: Border.all(
          color: display.borderColor ?? theme.colorScheme.outline,
          width: display.borderWidth ?? 1,
        ),
        borderRadius: radius,
        color: display.backgroundColor,
        boxShadow: display.shadow,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: radius,
          onTap: _interactive ? _openSelection : null,
          child: Padding(
            padding: display.padding ?? const EdgeInsets.all(12),
            child: Row(mainAxisSize: MainAxisSize.min, children: content),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneNumberField(BuildContext context) {
    final config = widget.phoneNumber;
    if (config.customBuilder != null) {
      return config.customBuilder!(context, _controller);
    }

    final colors = Theme.of(context).colorScheme;
    final radius = BorderRadius.circular(config.borderRadius ?? 8);
    final width = config.borderWidth ?? 1;
    OutlineInputBorder border(Color color) => OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(color: color, width: width),
    );
    final normalColor = config.borderColor ?? colors.outline;

    return TextFormField(
      controller: _controller,
      focusNode: config.focusNode,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      style: config.textStyle,
      onTapUpOutside: (_) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        hintText: config.hint ?? _strings.phoneNumber,
        labelText: config.labelText,
        helperText: config.helperText,
        errorText: config.errorText,
        prefixIcon: config.prefixIcon,
        suffixIcon: config.suffixIcon,
        prefixText: config.prefixText,
        suffixText: config.suffixText,
        contentPadding: config.contentPadding,
        counterText: '',
        border: border(normalColor),
        enabledBorder: border(normalColor),
        disabledBorder: border(normalColor.withValues(alpha: .5)),
        focusedBorder: border(config.focusedBorderColor ?? colors.primary),
        errorBorder: border(config.errorBorderColor ?? colors.error),
        focusedErrorBorder: border(config.errorBorderColor ?? colors.error),
      ),
      keyboardType: config.keyboardType ?? TextInputType.phone,
      textInputAction: config.textInputAction ?? TextInputAction.done,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        ...?config.inputFormatters,
      ],
      autovalidateMode: config.autovalidateMode,
      validator: _validator,
      maxLength: _selectedInfo?.maxLength,
      onChanged: _onPhoneNumberChanged,
      onFieldSubmitted: config.onSubmitted,
    );
  }

  @override
  Widget build(BuildContext context) {
    final selector = widget.selection.customSelectionBuilder != null
        ? widget.selection.customSelectionBuilder!(context, _openSelection)
        : _buildCountryDisplay(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KeyedSubtree(key: _selectorKey, child: selector),
        SizedBox(width: widget.layout.fieldSpacing),
        Expanded(child: _buildPhoneNumberField(context)),
      ],
    );
  }
}

/// Searchable country list used by the dialog and bottom sheet.
class _CountryPicker extends StatefulWidget {
  const _CountryPicker({
    required this.phoneList,
    required this.selected,
    required this.strings,
    required this.selection,
    required this.onSelected,
    this.title,
  });

  final Map<PentaPhoneFieldCountryCodesEnum, PentaPhoneFieldPhoneInfo>
  phoneList;
  final PentaPhoneFieldCountryCodesEnum? selected;
  final PentaPhoneFieldStrings strings;
  final PentaPhoneFieldCountrySelectionConfig selection;
  final ValueChanged<PentaPhoneFieldCountryCodesEnum> onSelected;
  final String? title;

  @override
  State<_CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<_CountryPicker> {
  late List<MapEntry<PentaPhoneFieldCountryCodesEnum, PentaPhoneFieldPhoneInfo>>
  _items = widget.phoneList.entries.toList();

  void _filter(String query) {
    final q = query.trim().toLowerCase();
    setState(() {
      _items = widget.phoneList.entries.where((entry) {
        if (q.isEmpty) return true;
        final info = entry.value;
        return info.countryName.toLowerCase().contains(q) ||
            info.dialCode.contains(q) ||
            info.countryCode.toLowerCase().contains(q);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selection = widget.selection;

    return Column(
      children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(widget.title!, style: theme.textTheme.titleLarge),
          ),
        if (selection.showSearch) ...[
          TextField(
            onChanged: _filter,
            decoration: InputDecoration(
              hintText: selection.searchHint ?? widget.strings.searchCountries,
              prefixIcon:
                  selection.styling.searchWidget ?? const Icon(Icons.search),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
        ],
        Expanded(
          child: _items.isEmpty
              ? Center(
                  child: Text(
                    selection.searchNoResultsText ??
                        widget.strings.noCountriesFound,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final MapEntry(key: country, value: info) = _items[index];
                    final isSelected = country == widget.selected;
                    void onTap() => widget.onSelected(country);

                    final builder = selection.customListTileBuilder;
                    if (builder != null) {
                      return builder(context, info, isSelected, onTap);
                    }
                    return ListTile(
                      leading: Text(
                        info.flag,
                        style: const TextStyle(fontSize: 24),
                      ),
                      title: Text(info.countryName),
                      subtitle: Text(info.dialCode),
                      selected: isSelected,
                      trailing: isSelected
                          ? selection.styling.selectedWidget ??
                                Icon(
                                  Icons.check,
                                  color: theme.colorScheme.primary,
                                )
                          : null,
                      onTap: onTap,
                    );
                  },
                ),
        ),
      ],
    );
  }
}
