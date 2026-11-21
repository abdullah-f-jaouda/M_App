import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
    required this.darkMode,
    required this.onDarkModeChanged,
  });
  final bool darkMode;
  final ValueChanged<bool> onDarkModeChanged;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _darkMode;

  @override
  void initState() {
    super.initState();
    _darkMode = widget.darkMode;
  }

  void _setDarkMode(bool value) {
    setState(() => _darkMode = value);
    widget.onDarkModeChanged(value);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('settings'.tr())),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          'preferences'.tr(),
          style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 12),
        Card(
          child: SwitchListTile(
            secondary: const Icon(Icons.dark_mode_outlined),
            title: Text('dark_mode'.tr()),
            subtitle: Text('dark_mode_hint'.tr()),
            value: _darkMode,
            onChanged: _setDarkMode,
          ),
        ),
        const SizedBox(height: 22),
        Text(
          'language'.tr(),
          style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 12),
        Card(
          child: RadioGroup<String>(
            groupValue: context.locale.languageCode,
            onChanged: (value) {
              if (value != null) context.setLocale(Locale(value));
            },
            child: Column(
              children: [
                const RadioListTile<String>(
                  value: 'en',
                  title: Text('English'),
                  secondary: Text('EN'),
                ),
                const Divider(height: 1),
                const RadioListTile<String>(
                  value: 'ar',
                  title: Text('العربية'),
                  secondary: Text('ع'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 22),
        Center(
          child: Text(
            'app_version'.tr(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    ),
  );
}
