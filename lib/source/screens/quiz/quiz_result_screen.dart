import 'package:eitango_kun/source/screens/add_screen.dart';
import 'package:eitango_kun/source/screens/edit_screen.dart';
import 'package:eitango_kun/source/screens/index_screen.dart';
import 'package:eitango_kun/source/screens/quiz/quiz_stanby_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class QuizResultScreen extends StatefulWidget {
  const QuizResultScreen({Key? key}) : super(key: key);

  @override
  State<QuizResultScreen> createState() => QuizResultScreenState();
}

class QuizResultScreenState extends State<QuizResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ResultScene'),
        ),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    leading: Container(
                      width: 48,
                      height: 48,
                      color: Colors.grey,
                    ),
                    title: Text(
                      'サンプル',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 24),
                    ),
                  ));
                }),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () async{
                        var result = await Navigator.pushAndRemoveUntil(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => IndexScreen()),
                                (_) => false);
                      },
                      child: Text('OK')),
                )),
          ],
        ));
  }
}
