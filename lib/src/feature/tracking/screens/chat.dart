import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CourierChatScreen extends StatelessWidget {
  const CourierChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        leadingWidth: 70,
        scrolledUnderElevation: 0,
        toolbarHeight: 75,
        actionsPadding: EdgeInsets.only(right: 24),
        title: Text(
          'Дмитрий Жуков',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 17
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: GestureDetector(
            onTap: (){
              context.goNamed(AppRoute.traking.name);
            },
            child: CircleAvatar(
              backgroundColor: Color(0xffECF0F4),
              child: Padding(
                padding: const EdgeInsets.only(right: 1),
                child: SvgPicture.asset(
                  PathImages.back,
                  width: 8,
                  colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              children: const [
                _ChatMessage(
                  time: '14:10',
                  text: 'Здравствуйте, вы можете подтвердить, что вы в пути?',
                  isReceived: false,
                ),
                _ChatMessage(
                  time: '14:11',
                  text: 'Добрый день! Да, ваш заказ уже готов, и я выехал к вам.',
                  isReceived: true,
                ),
                _ChatMessage(
                  time: '14:11',
                  text: 'Отлично, сколько времени займет доставка?',
                  isReceived: false,
                ),
                _ChatMessage(
                  time: '14:12',
                  text: 'Примерно 30 минут, в зависимости от трафика.',
                  isReceived: true,
                ),
                _ChatMessage(
                  time: '14:12',
                  text: 'Спасибо! Жду, до встречи!',
                  isReceived: false,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.tertiary,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.send,color: Colors.black,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                      hintText: 'Сообщение',
                      hintStyle: TextStyle(color: Color(0xffABABAB), fontSize: 13),
                      contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 18),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.surface,
                    ),
                  ),
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
      width: 20,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment:
            isReceived ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isReceived
                  ? Color(0xffF0F5FA)
                  : Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.circular(12)
            ),
            child: SizedBox(width: 214,
              child: Text(text, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)),
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