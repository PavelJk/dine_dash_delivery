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
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSettingsSection(
            title: 'Уведомления',
            children: [
              SwitchListTile(
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
                  _showDeleteAccountDialog(context);
                },
              ),
            ],
          ),
        ],
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
  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удалить аккаунт?'),
        content: const Text('Вы уверены, что хотите удалить аккаунт? Это действие нельзя отменить.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Удалить',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}