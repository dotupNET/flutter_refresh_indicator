import 'package:flutter/material.dart';

import 'AppDrawerState.dart';
// import 'package:flutter_dir_einen/01_Themes/ThemePreference.dart';

class AppDrawerStateProvider with ChangeNotifier {
  // ThemePreference themePreference = ThemePreference();
  late AppDrawerState state;

  AppDrawerStateProvider(this.state);
}
