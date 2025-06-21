import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showDeleteAccountDialog(BuildContext context, String title, String content, String textButton) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              context.goNamed(AppRoute.registrPhone.name);
            },
            child: Text(
              textButton,
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }