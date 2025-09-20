## 2.0.0
* Toast: Toast notification widget for displaying brief messages to users
* Showcase Tutorial Widget: Widget for creating interactive onboarding tutorials and feature highlights
* Extension formats updated: All extensions now use the simplified value.ext.x format instead of value.ext.category.x for easier and more intuitive usage

## 1.1.0
* International Phone Input: Complete phone number input with country selection
* Multi-language Support: Built-in support for 25+ languages
* Country Flag Display: Visual country flags with customizable display options
* Phone Number Validation: Built-in validation with customizable patterns
* Country Code Selection: Dropdown with searchable country list
* Customizable Layout: Flexible layout configuration options
* Callbacks Support: Comprehensive callback system for user interactions
* Text Widgets: Enhanced text widgets with underline support (PentaUnderlineText)
* SizedBox Widgets: Convenient spacing widgets (Gap widget for consistent layouts)
* Field Widgets: Organized field widget structure for better maintainability
* Cache Service: Renamed interface from ICache to IPentaCache for consistency
* Router Service: Renamed interface from IRouter to IPentaRouter for consistency
* Enhanced Utilities: Improved Firebase exception converter and loading dialog
* Updated README: Comprehensive documentation with usage examples
* Improved Constants: Enhanced app values and email validation constants
* Better Organization: Reorganized extension structure and removed unused object extensions
* Locale Manager: Enhanced locale management capabilities
* Fixed interface naming consistency across services
* Improved extension organization and removed deprecated components
* Enhanced locale manager functionality
* Updated pubspec.yaml with improved dependencies
* Enhanced example application with phone field demonstration

## 1.0.2+1
* Fixed version number consistency in pubspec.yaml and CHANGELOG.md

## 1.0.2
* Responsive Layout: PentaResponsiveWidget and PentaAdaptiveWidget for responsive design
* Layout Widgets: Padding, SizedBox, and layout management widgets
* Adaptive Widgets: Platform-specific widget rendering (Android, iOS, Web)
* String Extensions: Validation, conversion, random generation, and formatting
* DateTime Extensions: Formatting, calculation, comparison, and conversion utilities
* List & Map Extensions: Sorting, filtering, manipulation, and search operations
* Context Extensions: Screen information, theme access, and widget context utilities
* Number & Int Extensions: Math operations, formatting, and conversions
* Color Extensions: Material colors and color manipulation
* Widget Extensions: Sliver widgets and widget manipulation
* App Values Extensions: Padding, radius, and SizedBox utilities
* Bool Extensions: Boolean operations and operators
* Iterable Extensions: Iterable manipulation and filtering
* Uint8List Extensions: Binary data conversion utilities
* Object Extensions: Object manipulation and filtering
* Cache Service: Interface for caching operations
* Router Service: Navigation and routing interface
* Connectivity Service: Internet connection checking
* PentaDebouncer: Input debouncing utilities
* PentaEventBus: Application-wide event management
* LoadingCallbackDialog: Callback-based loading dialogs
* FirebaseExceptionConverter: Firebase error message conversion
* ImageStringConverter: Image loading with error handling
* TimestampConverter: Timestamp conversion utilities
* Response Models: Standardized API response handling
* Error Models: Comprehensive error handling and management
* Use Case Models: Clean architecture use case patterns for different scenarios
* Object Models: Base models with ID support
* Material Models: Material design color utilities
* State Mixins: Safe state management for widgets
* Repository Mixins: Data repository patterns for clean architecture
* Widget State Mixins: Widget-specific state management
* Locale Manager: Complete locale management system with provider support
* Locale Manager Extension: Extension methods for locale management
* Locale Manager Notifier: State management for locale changes
* Locale Manager Provider: Provider-based locale management
* App Values: Centralized application constants for consistent spacing
* Email Validation: Email validation constants and patterns
* Language Generator: CLI tool for generating locale keys from JSON files
* Fixed vertical padding calculation in _PaddingAppValuesExt
* Improved timeWhen method to correctly identify 'Today' condition
* Added UTC normalization for date extensions
* Updated README.md for consistency and clarity
* Added comprehensive package description
* Created initial CHANGELOG.md structure
* Added homepage and repository fields to pubspec.yaml
* Updated lang_generator executable path in pubspec.yaml
* Added timeWhen method for improved date formatting

---

## Links

- [GitHub Repository](https://github.com/ANILSRGT/flutter_penta_core)
- [Pub.dev Package](https://pub.dev/packages/penta_core)
- [Documentation](https://github.com/ANILSRGT/flutter_penta_core#readme)