import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final List<Address> _addresses = [
    Address(
      title: 'ДОМ',
      fullAddress: 'г. Йошкар-Ола, ул. Пушкина, 15, кв. 50, 2 под., 3 этаж, домофон',
    ),
    Address(
      title: 'РАБОТА',
      fullAddress: 'г. Йошкар-Ола, ул. Прохоров, 30, оф., 1 под., 1 этаж, домофон',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мой адрес'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _addresses.length,
              itemBuilder: (context, index) => _buildAddressCard(_addresses[index]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: _addNewAddress,
                child: const Text('ДОБАВИТЬ АДРЕС'),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildAddressCard(Address address) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              address.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(address.fullAddress),
            const SizedBox(height: 12),
            Row(
              children: [
                TextButton(
                  onPressed: () => _editAddress(address),
                  child: const Text('Редактировать'),
                ),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: () => _deleteAddress(address),
                  child: const Text(
                    'Удалить',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void _addNewAddress() {
    _showAddressEditDialog(null);
  }
  void _editAddress(Address address) {
    _showAddressEditDialog(address);
  }
  void _deleteAddress(Address address) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удалить адрес?'),
        content: Text('Вы уверены, что хотите удалить адрес "${address.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _addresses.remove(address);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Адрес удален')),
              );
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
  void _showAddressEditDialog(Address? address) {
    final titleController = TextEditingController(text: address?.title ?? '');
    final addressController = TextEditingController(text: address?.fullAddress ?? '');
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(address == null ? 'Новый адрес' : 'Редактировать адрес'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Название (Дом, Работа и т.д.)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: 'Полный адрес',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          ElevatedButton(
            onPressed: () {
              final newAddress = Address(
                title: titleController.text,
                fullAddress: addressController.text,
              );

              setState(() {
                if (address == null) {
                  _addresses.add(newAddress);
                } else {
                  final index = _addresses.indexOf(address);
                  _addresses[index] = newAddress;
                }
              });

              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Адрес "${newAddress.title}" сохранен')),
              );
            },
            child: const Text('Сохранить'),
          ),
        ],
      ),
    );
  }
}
class Address {
  String title;
  String fullAddress;

  Address({
    required this.title,
    required this.fullAddress,
  });
}