import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff0000ff))
          )
      ),
    );
  }
}
