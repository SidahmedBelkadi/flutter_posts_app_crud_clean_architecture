import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final int minLines;
  final int maxLines;
  const CustomFormField({
    super.key,
    required this.hintText,
    this.minLines = 1,
    this.maxLines = 1,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      maxLines: maxLines,
      controller: textEditingController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This Field Cannot be empty.";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
