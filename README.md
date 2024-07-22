# borra_app

A new Borra Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

sign_up
┣ business_logic
┃ ┣ blocs
┃ ┗ cubits
┣ data
┃ ┣ models
┃ ┣ repositories
┃ ┗ services
┗ presentation
┃ ┣ animations
┃ ┣ pages
┃ ┣ screens
┃ ┃ ┗ sign_up_screen.dart
┃ ┗ widgets

The sign_up/business_logic directory contains the Bloc and Cubit classes that manage the business logic of the sign-up feature. The blocs directory contains the Bloc classes, while the cubits directory contains the Cubit classes.

The sign_up/data directory contains the data components, including models, repositories, and services. The models directory contains the data models that are used by the Bloc or Cubit classes. The repositories directory contains the classes that handle data storage and retrieval. The services directory contains any classes that handle network requests or other services required by the Bloc or Cubit.

The sign_up/presentation directory contains the code for the presentation layer, including animations, pages, screens, and widgets. The animations directory contains any animations used by the feature. The pages directory contains the page-level components that make up the screen. The screens directory contains the screen-level components, including the sign_up_screen.dart file. The widgets directory contains any reusable widgets that are used by the screens.

### Configurate localization
1. To add more localization (languages, resources), go to translation folder and add new `[language-code].json` file or modify the existed resouces. etc: [en.json](./assets/translations/en.json)

2. Generate keys using this command

```
dart run easy_localization:generate -S assets/translations -O lib/app_base/generated -o locale_keys.g.dart -f keys 
```

3. Transform from keys to string resource

```
tr(LocaleKeys.key_name)
```

### Generate Freezed

```
dart run build_runner build --delete-conflicting-outputs
```

### Generate native splash screen
1. Modify flutter_native_splash.yaml
2. Run the following command

```
dart run flutter_native_splash:create
```
