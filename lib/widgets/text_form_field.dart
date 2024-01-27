import 'package:flutter/material.dart';

class ATextFormField extends StatelessWidget {
  final FormFieldValidator validator;
  final FormFieldSetter onSaved;
  final TextInputType? keyboardType;
  final String labelText;
  final int? minLines;
  final int maxLines;

  const ATextFormField({
    Key? key,
    required this.validator,
    required this.onSaved,
    this.keyboardType,
    required this.labelText,
    this.minLines,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
        labelText: labelText,
        errorStyle: TextStyle(color: Colors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusColor: Colors.white,
        fillColor: Colors.white,
        labelStyle: TextStyle(color: Colors.white),
      ),
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
    );
  }
}
