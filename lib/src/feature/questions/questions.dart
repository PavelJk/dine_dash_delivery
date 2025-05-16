import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final List<FAQItem> _faqItems = [
    FAQItem(
      question: 'Есть ли возможность изменить адрес доставки после оформления заказа?',
      answer: 'К сожалению, изменить адрес доставки после оформления заказа нельзя. Если вам нужно изменить адрес, лучше всего отменить текущий заказ и оформить новый.',
    ),
    FAQItem(
      question: 'Как сделать заказ через приложение?',
      answer: 'Для оформления заказа выберите нужные товары в каталоге, добавьте их в корзину, укажите адрес доставки и выберите способ оплаты. Подтвердите заказ, и мы начнем его обработку.',
    ),
    FAQItem(
      question: 'Как отслеживать статус моего заказа?',
      answer: 'Статус заказа можно отслеживать в разделе "Мои заказы". Там вы увидите текущий этап выполнения заказа: обработка, приготовление, доставка и т.д.',
    ),
    FAQItem(
      question: 'Как можно отменить заказ?',
      answer: 'Заказ можно отменить в течение 5 минут после его оформления. Для этого перейдите в раздел "Мои заказы" и выберите опцию "Отменить".',
    ),
    FAQItem(
      question: 'Как можно оставить отзыв о доставке?',
      answer: 'После получения заказа вам придет уведомление с просьбой оценить сервис. Вы можете оставить отзыв и оценку в этом уведомлении или в разделе "Мои заказы".',
    ),
    FAQItem(
      question: 'Как изменить адрес доставки?',
      answer: 'Адрес доставки можно изменить в профиле в разделе "Мои адреса". Для текущего заказа адрес можно изменить только до момента его подтверждения.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        scrolledUnderElevation: 0,
        toolbarHeight: 75,
        actionsPadding: EdgeInsets.only(right: 24),
        title: Text(
          'Частые вопросы',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 18
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: GestureDetector(
            onTap: (){
              context.pop('value');
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._faqItems.map((item) => _buildExpansionTile(item)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildExpansionTile(FAQItem item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ExpansionTile(
        backgroundColor: Color(0xffEDF0FA),
        collapsedBackgroundColor: Color(0xffEDF0FA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        
        title: Text(
          item.question,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff181C2E),
            fontWeight: FontWeight.w400,
          ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              item.answer,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Color(0xff747783),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}