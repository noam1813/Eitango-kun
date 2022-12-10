import 'package:eitango_kun/source/components/nh_input_field.dart';
import 'package:eitango_kun/source/services/eitango_service.dart';
import 'package:flutter/material.dart';
import '../models/eitango.dart';

class AddScreen extends StatefulWidget {
  AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  Eitango? _eitango = Eitango();
  EitangoService _eitangoService = EitangoService();
  final TextEditingController englishTextFieldController = TextEditingController();
  final TextEditingController japaneseTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AddScene'),
        ),
        body: Stack(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      height: 20,
                    ),
                    NHInputField(
                        controller: englishTextFieldController,
                        labelName: 'English'),
                    Container(
                      height: 20,
                    ),
                    NHInputField(
                        controller: japaneseTextFieldController,
                        labelName: '日本語'),
                  ],
                ),
              ),
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
                              onPressed: () {
                                Navigator.pop(context);
                              }, child: Text('キャンセル'))),
                      Spacer(
                        flex: 1,
                      ),
                      Expanded(
                          flex: 3,
                          child: ElevatedButton(
                              onPressed: () async {
                                _eitango?.english_word = englishTextFieldController.text;
                                _eitango?.japanese_word = japaneseTextFieldController.text;
                                var result = await _eitangoService.saveEitango(_eitango!);
                                print(result);

                                Navigator.pop(context);
                              }, child: Text('保存'))),
                    ],
                  ),
                ))
          ],
        ));
  }
}
