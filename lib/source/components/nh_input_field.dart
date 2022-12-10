import 'package:flutter/material.dart';

class NHInputField extends StatelessWidget {
  const NHInputField({required this.labelName, Key? key}) : super(key: key);
  final String labelName;

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
        const Expanded(flex: 3, child: TextField()),
      ],
    );
  }
}
