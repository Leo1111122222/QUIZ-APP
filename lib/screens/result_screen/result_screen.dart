import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/quiz_controller.dart';
import 'package:quiz_app/widgets/custom_button.dart';

import '../../constants.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);
  static const routeName = '/result_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/rr.png'), fit: BoxFit.cover),
            ),
          ),
          Center(
            child: GetBuilder<QuizController>(
              init: Get.find<QuizController>(),
              builder: (controller) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Congratulation',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Center(
                        child: Text(
                          controller.name,
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Your Score is',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    '${controller.scoreResult.round()} /100',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: KPrimaryColor,
                        ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                      width: 200,
                      onPressed: () => controller.startAgain(),
                      text: 'Start Again'),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
