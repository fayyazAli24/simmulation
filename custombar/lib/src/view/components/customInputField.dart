import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  var controller ;
   CustomInputField({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff0000ff))
          )
      ),
    );
  }
}
