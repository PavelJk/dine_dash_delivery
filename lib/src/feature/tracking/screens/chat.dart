import 'package:flutter/material.dart';

class CourierChatScreen extends StatelessWidget {
  const CourierChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Дмитрий Жуков',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Курьер',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: const [
                _ChatMessage(
                  time: '14:10',
                  text: 'Здравствуйте, вы можете подтвердить, что вы в пути?',
                  isReceived: true,
                ),
                _ChatMessage(
                  time: '14:11',
                  text: 'Добрый день! Да, ваш заказ уже готов, и я выехал к вам.',
                  isReceived: false,
                ),
                _ChatMessage(
                  time: '14:11',
                  text: 'Отлично, сколько времени займет доставка?',
                  isReceived: true,
                ),
                _ChatMessage(
                  time: '14:12',
                  text: 'Примерно 30 минут, в зависимости от трафика.',
                  isReceived: false,
                ),
                _ChatMessage(
                  time: '14:12',
                  text: 'Спасибо! Жду, до встречи!',
                  isReceived: true,
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Сообщение',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Отправка сообщения
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatMessage extends StatelessWidget {
  final String time;
  final String text;
  final bool isReceived;

  const _ChatMessage({
    required this.time,
    required this.text,
    required this.isReceived,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment:
            isReceived ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isReceived
                  ? Colors.grey[200]
                  : Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12),
                topRight: const Radius.circular(12),
                bottomLeft: isReceived
                    ? const Radius.circular(0)
                    : const Radius.circular(12),
                bottomRight: isReceived
                    ? const Radius.circular(12)
                    : const Radius.circular(0),
              ),
            ),
            child: Text(text),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              time,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}