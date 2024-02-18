class SettingsProvider {
  // Singleton Provider
  static final SettingsProvider _settingsProvider = SettingsProvider._internal();

  factory SettingsProvider() {
    return _settingsProvider;
  }

  SettingsProvider._internal();
// Singleton Provider
}