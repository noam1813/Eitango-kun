import 'package:eitango_kun/source/screens/quiz/quiz_main_screen.dart';
import 'package:flutter/material.dart';

class QuizStanbyScreen extends StatefulWidget {
  QuizStanbyScreen({Key? key}) : super(key: key);

  @override
  State<QuizStanbyScreen> createState() => _QuizStanbyScreenState();
}

enum QuizMode { JAPANESE_TO_ENGLISH, ENGLISH_TO_JAPANESE }

class _QuizStanbyScreenState extends State<QuizStanbyScreen> {
  QuizMode? _quizMode = QuizMode.ENGLISH_TO_JAPANESE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QuizSetting'),
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              ListTile(
                title: Text('英語→日本語'),
                leading: Radio<QuizMode>(
                  value: QuizMode.ENGLISH_TO_JAPANESE,
                  groupValue: _quizMode,
                  onChanged: (QuizMode? _value) {
                    setState(() {
                      _quizMode = _value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('日本語→英語'),
                leading: Radio<QuizMode>(
                  value: QuizMode.JAPANESE_TO_ENGLISH,
                  groupValue: _quizMode,
                  onChanged: (QuizMode? _value) {
                    setState(() {
                      _quizMode = _value;
                    });
                  },
                ),
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
                            onPressed: () async {
                              var result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QuizMainScreen()));
                            },
                            child: Text('開始'))),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
