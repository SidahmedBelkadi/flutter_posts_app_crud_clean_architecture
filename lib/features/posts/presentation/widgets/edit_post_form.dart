import 'package:flutter/material.dart';
import 'package:posts_app/features/posts/presentation/widgets/custom_form_button.dart';

class EditPostForm extends StatefulWidget {
  const EditPostForm({super.key});

  @override
  State<EditPostForm> createState() => _EditPostFormState();
}

class _EditPostFormState extends State<EditPostForm> {
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
