import 'package:alkebuware_website/text.dart';
import 'package:flutter/material.dart';

typedef Stringifier<T> = String Function(T value);

class ADropdownFormField<T> extends StatelessWidget {
  final List<T> items;
  final String labelText;
  final FormFieldSetter onSaved;
  final FormFieldValidator validator;
  final Stringifier<T> stringify;

  const ADropdownFormField(
      {Key key,
      @required this.items,
      @required this.labelText,
      @required this.onSaved,
      @required this.validator,
      this.stringify})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
        decoration: InputDecoration(
          labelText: labelText,
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
          errorStyle: TextStyle(color: Colors.white),
        ),
        onSaved: onSaved,
        validator: validator,
        selectedItemBuilder: (context) {
          return items
              .map((range) => DropdownMenuItem(
                  value: range,
                  child: Text(
                      stringify == null ? range.toString() : stringify(range),
                      style: white16)))
              .toList();
        },
        items: items
            .map((range) => DropdownMenuItem(
                value: range,
                child: Text(
                  stringify == null ? range.toString() : stringify(range),
                )))
            .toList(),
        onChanged: (value) {});
  }
}
