import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();

  String _name = "Павел Бартеньев";
  String _bio = "Я люблю фаст-фуд";
  String _email = "pavel.2021@list.ru";
  String _phone = "+7 777 778-80-18";
  String _birthDate = "01.03.2003";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                if (_isEditing && _formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }
                _isEditing = !_isEditing;
              });
            },
            child: Text(
              _isEditing ? 'СОХРАНИТЬ' : 'ИЗМЕНИТЬ',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blueGrey,
                    child: Text(
                      "ПБ",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _bio,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileField(
                    label: 'ФИО',
                    value: _name,
                    isEditing: _isEditing,
                    onSaved: (value) => _name = value!,
                  ),
                  _buildProfileField(
                    label: 'ПОЧТА',
                    value: _email,
                    isEditing: _isEditing,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите email';
                      }
                      if (!value.contains('@')) {
                        return 'Некорректный email';
                      }
                      return null;
                    },
                    onSaved: (value) => _email = value!,
                  ),
                  _buildProfileField(
                    label: 'НОМЕР ТЕЛЕФОНА',
                    value: _phone,
                    isEditing: _isEditing,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите номер телефона';
                      }
                      if (value.length < 10) {
                        return 'Номер слишком короткий';
                      }
                      return null;
                    },
                    onSaved: (value) => _phone = value!,
                  ),
                  _buildProfileField(
                    label: 'ДАТА РОЖДЕНИЯ',
                    value: _birthDate,
                    isEditing: _isEditing,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите дату рождения';
                      }
                      return null;
                    },
                    onSaved: (value) => _birthDate = value!,
                    isDate: true,
                    context: context,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildProfileField({
    required String label,
    required String value,
    required bool isEditing,
    required FormFieldSetter<String> onSaved,
    FormFieldValidator<String>? validator,
    bool isDate = false,
    BuildContext? context,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          if (isEditing)
            TextFormField(
              initialValue: value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
              validator: validator,
              onSaved: onSaved,
              onTap: isDate
                  ? () async {
                      final date = await showDatePicker(
                        context: context!,
                        initialDate: DateTime(2003, 3, 1),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (date != null) {
                        onSaved("${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}");
                      }
                    }
                  : null,
              readOnly: isDate,
            )
          else
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                value,
                style: const TextStyle(fontSize: 16),
              ),
            ),
        ],
      ),
    );
  }
}