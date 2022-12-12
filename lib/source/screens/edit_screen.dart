import 'package:flutter/material.dart';
import 'package:eitango_kun/source/components/nh_input_field.dart';

import '../models/eitango.dart';
import '../services/eitango_service.dart';

class EditScreen extends StatefulWidget {
  final Eitango? eitango;
  EditScreen({Key? key,required this.eitango}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  Eitango? _eitango = Eitango();
  EitangoService _eitangoService = EitangoService();
  final TextEditingController englishTextFieldController =
      TextEditingController();
  final TextEditingController japaneseTextFieldController =
      TextEditingController();

  void initState(){
    super.initState();
    englishTextFieldController.text = widget.eitango!.english_word!;
    japaneseTextFieldController.text = widget.eitango!.japanese_word!;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddScene'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: IconButton(onPressed: (){},icon: Icon(Icons.delete),),
          )
        ],
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
                            },
                            child: Text('キャンセル'))),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                        flex: 3,
                        child: ElevatedButton(
                            onPressed: () async {
                              _eitango?.english_word =
                                  englishTextFieldController.text;
                              _eitango?.japanese_word =
                                  japaneseTextFieldController.text;
                              var result =
                                  await _eitangoService.saveEitango(_eitango!);
                              print(result);

                              Navigator.pop(context, true);
                            },
                            child: Text('保存'))),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
