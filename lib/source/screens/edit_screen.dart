import 'package:flutter/material.dart';
import 'package:eitango_kun/source/components/nh_input_field.dart';

import '../models/eitango.dart';
import '../services/eitango_service.dart';

class EditScreen extends StatefulWidget {
  final Eitango? editingEitango;

  EditScreen({Key? key, required this.editingEitango}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  Eitango? _eitango = Eitango();
  EitangoService _eitangoService = EitangoService();
  final TextEditingController _englishTextFieldController =
      TextEditingController();
  final TextEditingController _japaneseTextFieldController =
      TextEditingController();

  void initState() {
    super.initState();
    _englishTextFieldController.text = widget.editingEitango!.english_word!;
    _japaneseTextFieldController.text = widget.editingEitango!.japanese_word!;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditScene'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () async {
                var result = await _eitangoService
                    .removeEitango(widget.editingEitango!.id!);
                print(result);
                Navigator.pop(context, true);
              },
              icon: Icon(Icons.delete),
            ),
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
                      controller: _englishTextFieldController,
                      labelName: 'English'),
                  Container(
                    height: 20,
                  ),
                  NHInputField(
                      controller: _japaneseTextFieldController,
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
                              widget.editingEitango?.english_word =
                                  _englishTextFieldController.text;
                              widget.editingEitango?.japanese_word =
                                  _japaneseTextFieldController.text;
                              var result = await _eitangoService
                                  .updateEitango(widget.editingEitango!);
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
