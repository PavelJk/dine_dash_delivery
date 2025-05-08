import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/setting/widgets/setting_appbar.dart';
import 'package:dine_dash_delivery/src/feature/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final List<Address> _addresses = [
    Address(
      title: 'ДОМ',
      fullAddress: 'г. Йошкар-Ола, ул. Пушкина, 15, кв. 50, 2 под., 3 этаж, домофон +',
    ),
    Address(
      title: 'РАБОТА',
      fullAddress: 'г. Йошкар-Ола, ул. Прохоров, 30, оф., 1 под., 1 этаж, домофон -',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsAppBar(text: 'Мой адрес'),
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
            padding: const EdgeInsets.all(24),
            child: MyCustomMainButton(
              onPressed: () {
                context.goNamed(AppRoute.map.name);
              },
              text: 'ДОБАВИТЬ АДРЕС',
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildAddressCard(Address address) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffF0F5FA),
          borderRadius: BorderRadius.circular(20)
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: SvgPicture.asset(
                  address.title == 'ДОМ' ? PathImages.home : PathImages.work,
                  width: 10,
                  height: 10,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    address.title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  GestureDetector(
                   onTap: () => _deleteAddress(address),
                   child: SvgPicture.asset(
                       PathImages.deletedAddress,
                   ),
                  ),
                ],
              ),
              SizedBox(height: 8),
               Text(
                  address.fullAddress,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Color(0xff32343E).withValues(alpha: 0.5)
                  ),
                ),
            ],
          ),
        ),
      ),
    );
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
class Address {
  String title;
  String fullAddress;

  Address({
    required this.title,
    required this.fullAddress,
  });
}