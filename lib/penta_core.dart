/// Core toolkit for Flutter apps.
///
/// Extensions are namespaced under `.ext` to avoid clashes with other
/// packages: `context.ext.theme`, `AppValues.md.ext.padding.all`,
/// `'mail@x.com'.ext.validEmail`.
library;

// Constants
export 'src/constants/app_values.dart';
export 'src/constants/disposable_email_domains.dart';
// Extensions
export 'src/extensions/app_values_ext.dart';
export 'src/extensions/bool_ext.dart';
export 'src/extensions/color_ext.dart';
export 'src/extensions/context_ext.dart';
export 'src/extensions/date_time_ext.dart';
export 'src/extensions/iterable_ext.dart';
export 'src/extensions/map_ext.dart';
export 'src/extensions/num_ext.dart';
export 'src/extensions/string_ext.dart';
export 'src/extensions/uint8list_ext.dart';
export 'src/extensions/widget_ext.dart';
// Localization
export 'src/localization/locale_manager.dart';
// Mixins
export 'src/mixins/data_repo_mixin.dart';
export 'src/mixins/safe_state_mixin.dart';
export 'src/mixins/widget_state_mixin.dart';
// Models
export 'src/models/error_model.dart';
export 'src/models/model_with_id.dart';
export 'src/models/on_color.dart';
export 'src/models/response_model.dart';
export 'src/models/use_cases.dart';
// Services
export 'src/services/penta_cache.dart';
export 'src/services/penta_router.dart';
// Utils
export 'src/utils/connectivity_service.dart';
export 'src/utils/firebase_exception_converter.dart';
export 'src/utils/image/image_string_converter.dart';
export 'src/utils/loading_callback_dialog.dart';
export 'src/utils/penta_debouncer.dart';
export 'src/utils/penta_event_bus.dart';
export 'src/utils/timestamp_converter.dart';
// Widgets
export 'src/widgets/adaptive/penta_adaptive_widget.dart';
export 'src/widgets/field/phone/penta_phone_field.dart';
export 'src/widgets/gap/gap.dart';
export 'src/widgets/padding/remove_padding.dart';
export 'src/widgets/painters/draw_arrow/penta_draw_arrow_painter.dart';
export 'src/widgets/responsive/penta_breakpoints.dart';
export 'src/widgets/responsive/penta_responsive_resolutions.dart';
export 'src/widgets/responsive/penta_responsive_widget.dart';
export 'src/widgets/responsive/penta_responsive_wrapper.dart';
export 'src/widgets/showcase/penta_showcase.dart';
export 'src/widgets/text/penta_underline_text.dart';
export 'src/widgets/toast/penta_toast.dart';
