import 'package:alkebuware_website/widgets/dialog.dart';
import 'package:alkebuware_website/widgets/send_button.dart';
import 'package:alkebuware_website/widgets/send_success.dart';
import 'package:alkebuware_website/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class ServicesInquiryDialog extends StatefulWidget {
  static const String routeName = "/services-inquiry";

  @override
  _ServicesInquiryDialogState createState() => _ServicesInquiryDialogState();
}

class _ServicesInquiryDialogState extends State<ServicesInquiryDialog> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _email;
  String _inquiry;
  String _title;
  bool _sendSucceeded = false;

  @override
  Widget build(BuildContext context) {
    _title = (ModalRoute.of(context).settings.arguments as Map)["title"];
    return ADialog(
      title: _title,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: _formKey,
          child: _sendSucceeded == true
              ? SendSuccess()
              : ListView(children: [
                  ATextFormField(
                    labelText: "Name*",
                    validator: (value) {
                      if (value.isEmpty) {
                        return "What's your name?";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value;
                    },
                  ),
                  ATextFormField(
                    labelText: "Email*",
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "What's your email?";
                      } else if (isEmail(value) != true) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value;
                    },
                  ),
                  ATextFormField(
                    labelText: "Inquiry*",
                    minLines: 3,
                    maxLines: 5,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please tell me how I can help";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _inquiry = value;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SendButton(
                          onSuccess: () {
                            setState(() => _sendSucceeded = true);
                          },
                          formKey: _formKey,
                          formData: () => {
                            "title": _title,
                            "name": _name,
                            "email": _email,
                            "inquiry": _inquiry,
                          },
                        )
                      ],
                    ),
                  )
                ]),
        ),
      ),
    );
  }
}
