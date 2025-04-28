import 'package:flutter/material.dart';

class ProductFilterPage extends StatefulWidget {
  @override
  _ProductFilterPageState createState() => _ProductFilterPageState();
}

class _ProductFilterPageState extends State<ProductFilterPage> {
  // Состояния для фильтров
  Set<String> selectedProducts = {};
  Set<String> selectedBrands = {};
  RangeValues priceRange = const RangeValues(0, 10000);

  final Map<String, List<String>> productCategories = {
    'Картофель': ['Лук', 'Морковь'],
    'Свекла': ['Томаты'],
  };

  final List<String> brands = [
    'Мираторг',
    'Agama',
    '4 Сезона',
    'Green Ribbon',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Фильтр', style: TextStyle(fontSize: 20)),
        actions: [
          TextButton(
            child: Text('Сбросить', style: TextStyle(color: Colors.white)),
            onPressed: () {
              setState(() {
                selectedProducts.clear();
                selectedBrands.clear();
                priceRange = const RangeValues(0, 10000);
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Вид продукта'),
            _buildProductCategories(),
            SizedBox(height: 24),
            _buildSectionTitle('БРЕНД'),
            _buildBrandFilter(),
            SizedBox(height: 24),
            _buildSectionTitle('ЦЕНА'),
            _buildPriceFilter(),
            SizedBox(height: 32),
            _buildApplyButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildProductCategories() {
    return Column(
      children: productCategories.entries.map((entry) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFilterItem(
              title: entry.key,
              isSelected: selectedProducts.contains(entry.key),
              onTap: () {
                setState(() {
                  if (selectedProducts.contains(entry.key)) {
                    selectedProducts.remove(entry.key);
                  } else {
                    selectedProducts.add(entry.key);
                  }
                });
              },
            ),
            ...entry.value.map((subItem) {
              return Padding(
                padding: EdgeInsets.only(left: 24),
                child: _buildFilterItem(
                  title: subItem,
                  isSelected: selectedProducts.contains(subItem),
                  onTap: () {
                    setState(() {
                      if (selectedProducts.contains(subItem)) {
                        selectedProducts.remove(subItem);
                      } else {
                        selectedProducts.add(subItem);
                      }
                    });
                  },
                ),
              );
            }),
            if (entry.key == 'Свекла') 
              Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text('Ещё 24', style: TextStyle(color: Colors.grey)),
              ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildBrandFilter() {
    return Column(
      children: [
        ...brands.map((brand) {
          return _buildFilterItem(
            title: brand,
            isSelected: selectedBrands.contains(brand),
            onTap: () {
              setState(() {
                if (selectedBrands.contains(brand)) {
                  selectedBrands.remove(brand);
                } else {
                  selectedBrands.add(brand);
                }
              });
            },
          );
        }),
        Text('Ещё 24', style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildPriceFilter() {
    return Column(
      children: [
        RangeSlider(
          values: priceRange,
          min: 0,
          max: 10000,
          divisions: 10,
          labels: RangeLabels(
            '${priceRange.start.round()} ₽',
            '${priceRange.end.round()} ₽',
          ),
          onChanged: (RangeValues values) {
            setState(() {
              priceRange = values;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('ОТ ${priceRange.start.round()} ₽'),
            Text('ДО ${priceRange.end.round()} ₽'),
          ],
        ),
      ],
    );
  }

  Widget _buildFilterItem({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? Colors.orange : Colors.grey,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(4),
                color: isSelected ? Colors.orange : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(Icons.check, size: 14, color: Colors.white)
                  : null,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApplyButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          Navigator.pop(context, {
            'products': selectedProducts.toList(),
            'brands': selectedBrands.toList(),
            'minPrice': priceRange.start.round(),
            'maxPrice': priceRange.end.round(),
          });
        },
        child: Text(
          'ПРИМЕНИТЬ',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}