import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<void> selectDate(TextEditingController controller, BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2030),
    );

   if (pickedDate == null) return;
   controller.text = DateFormat('dd.MM.yyyy').format(pickedDate);
} 