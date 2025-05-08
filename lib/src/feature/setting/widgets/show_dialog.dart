import 'package:flutter/material.dart';

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
              Navigator.pop(context);
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