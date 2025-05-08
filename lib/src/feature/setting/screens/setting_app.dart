import 'package:dine_dash_delivery/src/feature/setting/widgets/setting_appbar.dart';
import 'package:dine_dash_delivery/src/feature/setting/widgets/show_dialog.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkThemeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsAppBar(
        text: 'Настройки',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          children: [
            _buildSettingsSection(
              title: 'Уведомления',
              children: [
                SwitchListTile(
                  activeTrackColor: Theme.of(context).colorScheme.tertiary,
                  activeColor: Colors.black,
                  contentPadding: EdgeInsets.only(right: 6, left: 15),
                  title: const Text('Получать уведомления'),
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSettingsSection(
              title: 'Тема',
              children: [
                RadioListTile<bool>(
                  title: const Text('Светлая тема'),
                  value: false,
                  groupValue: _darkThemeEnabled,
                  onChanged: (value) {
                    setState(() {
                      _darkThemeEnabled = false;
                    });
                  },
                ),
                RadioListTile<bool>(
                  title: const Text('Тёмная тема'),
                  value: true,
                  groupValue: _darkThemeEnabled,
                  onChanged: (value) {
                    setState(() {
                      _darkThemeEnabled = true;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSettingsSection(
              title: 'Аккаунт',
              children: [
                ListTile(
                  title: const Text(
                    'Удалить аккаунт',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    showDeleteAccountDialog(
                      context,
                      'Удалить аккаунт?',
                      'Вы уверены, что хотите удалить аккаунт? Это действие нельзя отменить.',
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildSettingsSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

}