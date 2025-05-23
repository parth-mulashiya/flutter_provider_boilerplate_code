
# Flutter Provider Boilerplate Code

## Description

This is a Flutter project designed with a modular structure for easy scalability and maintenance. It uses several popular packages for state management, API interaction, localization, and more. Below is an overview of the folder structure, functionality, and key dependencies.

## Folder Structure

```
lib/
├── core/
│   ├── animations/
│   │   ├── animated_text.dart
│   │   ├── fade_in_widget.dart
│   │   ├── slide_fade_animation.dart
│   │   └── slide_in_widget.dart
│   ├── constants/
│   │   ├── api_constants.dart
│   │   ├── assets_constants.dart
│   │   ├── color_constants.dart
│   │   ├── common_constants.dart
|   |   ├── lang_constants.dart
│   │   ├── storage_constants.dart
│   │   ├── string_constants.dart
│   │   └── validator.dart
│   ├── extensions/
│   │   ├── core_extension.dart
│   │   ├── date_time_extension.dart
│   │   ├── lang_exetnsion.dart
│   │   └── padding_extension.dart
│   ├── network/
│   │   └── api_service.dart
│   ├── services/
│   │   ├── language_service.dart
│   │   └── shared_prefs_service.dart
│   ├── theme/
│   │   ├── app_theme.dart
│   │   └── theme_notifier.dart
│   └── widgets/
│       ├── app_button.dart
│       ├── app_text_field.dart
│       └── app_toast.dart
├── models/
│   └── post_model.dart
├── providers/
│   ├── login_provider.dart
│   └── second_provider.dart
├── routes/
│   ├── app_routes.dart
│   ├── error_screen.dart
│   └── transitions.dart
├── screens/
│   ├── about_screen.dart
│   ├── home_screen.dart
│   ├── login_screen.dart
│   ├── other_screen/
│   │   └── no_network_screen.dart
│   └── second_screen.dart
├── utils/
│   └── responsive_util.dart.
├── di.dart
└── main.dart
```

## Packages

* `provider`: Used for state management.
* `dio`: Used for making HTTP requests.
* `shared_preferences`: Used for storing and retrieving app data.
* `flutter_screenutil`: Used for screen size and density management.
* `flutter_easyloading`: Used for easy loading animations.
* `go_router`: Used for routing and navigation.
* `fluttertoast`: Used for displaying toast notifications.
* `intl`: Used for internationalization and localization.
* `flutter_localizations`: Used for providing built-in Flutter widget localization and support for multiple languages.

## Getting Started

This project is a starting point for a Flutter application. A few resources to get you started if this is your first Flutter project:

* [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
* [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the [online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on mobile development, and a full API reference.