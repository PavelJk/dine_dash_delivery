import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AddReviewScreen extends StatefulWidget {
  final String productName;
  final String productImage;

  const AddReviewScreen({super.key, required this.productName, required this.productImage});

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  int rating = 0; 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 167,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          context.goNamed(AppRoute.review.name);
                        },
                        child: CircleAvatar(
                          radius: 23,
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
                      SizedBox(width: 15,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          widget.productImage,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        widget.productName,
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontSize: 16  
                        )
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            rating = index + 1; 
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Icon(
                            Icons.star,
                            color: index < rating ? Theme.of(context).colorScheme.tertiary : Color(0xffC7C7C7),
                            size: 40,
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                children: [
                  Text(
                    'Заголовок',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  MyReviewTextField(
                    text: 'В 2 слова опишите ситуацию...',
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Как вам ресторан?',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  MyReviewTextField(
                    text: 'Напишите ваш отзыв...',
                    maxLines: 5,
                  ),
                  const SizedBox(height: 60),
                  MyCustomMainButton(
                    onPressed: (){
              
                  }, 
                  text: 'ОТПРАВИТЬ ОТЗЫВ'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class MyReviewTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String text;
  final int? maxLines;

  const MyReviewTextField({super.key, this.controller, required this.text, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(
              fontSize: 16,
              color: Color(0xff9C9BA6),
              fontWeight: FontWeight.w400
            ),
            contentPadding: EdgeInsets.all(15),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none
            ),
            filled: true,
            fillColor: Color(0xfff6f6f6),
          ),
          controller: controller,
        ),
      ],
    );
  }
}