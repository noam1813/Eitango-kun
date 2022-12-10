import 'package:eitango_kun/source/components/nh_input_field.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddScene'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 20,
              ),
              const NHInputField(labelName: 'English'),
              Container(
                height: 20,
              ),
              const NHInputField(labelName: '日本語'),
              // Padding(
              //   padding: const EdgeInsets.all(60),
              //   child: Row(
              //     children: [
              //       Expanded(
              //           flex: 3,
              //           child: OutlinedButton(
              //               onPressed: () {}, child: Text('キャンセル'))),
              //       Spacer(
              //         flex: 1,
              //       ),
              //       Expanded(
              //           flex: 3,
              //           child:
              //               ElevatedButton(onPressed: () {}, child: Text('保存'))),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
