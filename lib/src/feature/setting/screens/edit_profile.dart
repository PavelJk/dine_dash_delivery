import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  
  final TextEditingController _nameController = TextEditingController(text: "Павел Бартеньев");
  final TextEditingController _emailController = TextEditingController(text: "pavel.2021@list.ru");
  final TextEditingController _phoneController = TextEditingController(text: "+7 777 778-80-18");
  final TextEditingController _bioController = TextEditingController(text: "Я люблю фаст-фуд");

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Изменение профиля'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel('ФИО'),
              _buildTextField(_nameController, (value) {
                if (value == null || value.isEmpty) {
                  return 'Введите ФИО';
                }
                return null;
              }),
              const SizedBox(height: 20),
              _buildLabel('ПОЧТА'),
              _buildTextField(_emailController, (value) {
                if (value == null || value.isEmpty) {
                  return 'Введите email';
                }
                if (!value.contains('@')) {
                  return 'Некорректный email';
                }
                return null;
              }),
              const SizedBox(height: 20),
              _buildLabel('НОМЕР ТЕЛЕФОНА'),
              _buildTextField(_phoneController, (value) {
                if (value == null || value.isEmpty) {
                  return 'Введите номер телефона';
                }
                if (value.length < 10) {
                  return 'Номер слишком короткий';
                }
                return null;
              }, keyboardType: TextInputType.phone),
              const SizedBox(height: 20),
              _buildLabel('О СЕБЕ'),
              TextFormField(
                controller: _bioController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: _saveProfile,
                  child: const Text(
                    'СОХРАНИТЬ',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
    );
  }
  Widget _buildTextField(
    TextEditingController controller,
    FormFieldValidator<String> validator, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
      validator: validator,
      keyboardType: keyboardType,
    );
  }
  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      final updatedProfile = {
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
        'bio': _bioController.text,
      };
      debugPrint('Сохраненные данные: $updatedProfile');
      Navigator.pop(context, updatedProfile);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Профиль успешно сохранен')),
      );
    }
  }
}