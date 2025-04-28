import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String? _deliveryType;
  bool _onlinePayment = false;
  String? _deliveryTime;
  RangeValues _priceRange = const RangeValues(0, 10000);
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Фильтр'),
        actions: [
          TextButton(
            onPressed: () {
              // Сброс всех фильтров
              setState(() {
                _deliveryType = null;
                _onlinePayment = false;
                _deliveryTime = null;
                _priceRange = const RangeValues(0, 10000);
                _rating = 0;
              });
            },
            child: Text(
              'Сбросить',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Выбрать'),
            _buildDeliveryType(),
            SizedBox(height: 20),
            _buildSectionTitle('ВРЕМЯ ДОСТАВКИ'),
            _buildDeliveryTime(),
            SizedBox(height: 20),
            _buildSectionTitle('ЦЕНА'),
            _buildPriceFilter(),
            SizedBox(height: 20),
            _buildSectionTitle('РЕЙТИНГ'),
            _buildRatingFilter(),
            SizedBox(height: 30),
            _buildApplyButton(),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Галерея Вкусных Угощений',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.grey[800],
      ),
    );
  }

  Widget _buildDeliveryType() {
    return Column(
      children: [
        RadioListTile<String>(
          title: Text('Доставка'),
          value: 'Доставка',
          groupValue: _deliveryType,
          onChanged: (value) {
            setState(() {
              _deliveryType = value;
            });
          },
        ),
        RadioListTile<String>(
          title: Text('Самовывоз'),
          value: 'Самовывоз',
          groupValue: _deliveryType,
          onChanged: (value) {
            setState(() {
              _deliveryType = value;
            });
          },
        ),
        CheckboxListTile(
          title: Text('Акции'),
          value: _onlinePayment,
          onChanged: (bool? value) {
            setState(() {
              _onlinePayment = value!;
            });
          },
          secondary: Icon(Icons.local_offer),
        ),
        CheckboxListTile(
          title: Text('Онлайн-оплата'),
          value: _onlinePayment,
          onChanged: (bool? value) {
            setState(() {
              _onlinePayment = value!;
            });
          },
          secondary: Icon(Icons.payment),
        ),
      ],
    );
  }

  Widget _buildDeliveryTime() {
    return Wrap(
      spacing: 8,
      children: [
        _buildTimeChip('10-15 мин'),
        _buildTimeChip('20 мин'),
        _buildTimeChip('30 мин'),
      ],
    );
  }

  Widget _buildTimeChip(String time) {
    return ChoiceChip(
      label: Text(time),
      selected: _deliveryTime == time,
      onSelected: (selected) {
        setState(() {
          _deliveryTime = selected ? time : null;
        });
      },
    );
  }

  Widget _buildPriceFilter() {
    return Column(
      children: [
        RangeSlider(
          values: _priceRange,
          min: 0,
          max: 10000,
          divisions: 10,
          labels: RangeLabels(
            '${_priceRange.start.round()} ₽',
            '${_priceRange.end.round()} ₽',
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _priceRange = values;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('от ${_priceRange.start.round()} ₽'),
            Text('до ${_priceRange.end.round()} ₽'),
          ],
        ),
      ],
    );
  }

  Widget _buildRatingFilter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 30,
          ),
          onPressed: () {
            setState(() {
              _rating = index + 1.0;
            });
          },
        );
      }),
    );
  }

  Widget _buildApplyButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: () {
          // Применение фильтров
          Navigator.pop(context, {
            'deliveryType': _deliveryType,
            'onlinePayment': _onlinePayment,
            'deliveryTime': _deliveryTime,
            'minPrice': _priceRange.start.round(),
            'maxPrice': _priceRange.end.round(),
            'rating': _rating,
          });
        },
        child: Text(
          'ПРИМЕНИТЬ',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}