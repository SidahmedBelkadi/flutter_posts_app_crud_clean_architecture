import 'package:flutter/material.dart';
import 'custom_form_button.dart';

class AddPostForm extends StatefulWidget {
  const AddPostForm({super.key});

  @override
  State<AddPostForm> createState() => _AddPostFormState();
}

class _AddPostFormState extends State<AddPostForm> {
  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Title'),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(hintText: 'Content'),
              minLines: 3,
              maxLines: 7,
            ),
            SizedBox(height: 32.0),
            CutomFormButton(),
          ],
        ),
      ),
    );
  }
}
