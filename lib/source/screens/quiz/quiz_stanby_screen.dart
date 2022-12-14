import 'package:flutter/material.dart';

class QuizStanbyScreen extends StatefulWidget {
  QuizStanbyScreen({Key? key}) : super(key: key);

  @override
  State<QuizStanbyScreen> createState() => _QuizStanbyScreenState();
}

enum QuizMode { JAPANESE_TO_ENGLISH, ENGLISH_TO_JAPANESE }

class _QuizStanbyScreenState extends State<QuizStanbyScreen> {
  QuizMode _quizMode = QuizMode.ENGLISH_TO_JAPANESE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QuizSetting'),
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      RadioListTile(
                        title: Text('日→英'),
                        value: QuizMode.JAPANESE_TO_ENGLISH,
                        groupValue: _quizMode,
                        onChanged: (context) {},
                      ),
                      RadioListTile(
                        title: Text('英→日'),
                        value: QuizMode.ENGLISH_TO_JAPANESE,
                        groupValue: _quizMode,
                        onChanged: (context) {},
                      )
                    ],
                  )
                ],
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: OutlinedButton(
                                onPressed: () {}, child: Text('キャンセル'))),
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                            flex: 3,
                            child: ElevatedButton(
                                onPressed: () {}, child: Text('保存'))),
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
