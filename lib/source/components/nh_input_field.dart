import 'package:flutter/material.dart';

class NHInputField extends StatelessWidget {
  const NHInputField(
      {required this.labelName, required this.controller, Key? key})
      : super(key: key);

  final String labelName;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                labelName,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            )),
        Expanded(
            flex: 3,
            child: TextField(
              controller: controller,
            )),
      ],
    );
  }
}
