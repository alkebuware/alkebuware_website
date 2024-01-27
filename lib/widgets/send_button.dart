import 'package:alkebuware_website/colors.dart';
import 'package:alkebuware_website/text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'squared_button.dart';

typedef FormDataSetter = Map<String, String?> Function();

enum FormType {
  generalInquiry,
  hireMe,
  servicesInquiry;

  Uri get uri {
    switch (this) {
      case FormType.generalInquiry:
        return Uri.parse("https://formspree.io/f/mjvngjyj");
      case FormType.hireMe:
        return Uri.parse("https://formspree.io/f/xdoqayeb");
      case FormType.servicesInquiry:
        return Uri.parse("https://formspree.io/f/xayrqaek");
    }
  }
}

class SubmitFormButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final FormDataSetter formData;
  final VoidCallback onSuccess;
  final FormType type;

  const SubmitFormButton({
    Key? key,
    required this.formKey,
    required this.formData,
    required this.onSuccess,
    required this.type,
  }) : super(key: key);

  @override
  _SubmitFormButtonState createState() => _SubmitFormButtonState();
}

class _SubmitFormButtonState extends State<SubmitFormButton> {
  bool _inProgress = false;

  @override
  Widget build(BuildContext context) {
    return SquaredButton(
      textStyle: white20Medium,
      backgroundColor: aOrange,
      child: _inProgress == true
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            )
          : Row(children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text("Send", style: white20Medium),
              ),
              Image.asset("assets/images/send.png")
            ]),
      onTap: () async {
        if (!_inProgress && widget.formKey.currentState!.validate()) {
          widget.formKey.currentState!.save();
          setState(() => _inProgress = true);
          try {
            final response = await (MultipartRequest("POST", widget.type.uri)
                  ..followRedirects = false
                  ..fields.addAll(widget
                      .formData()
                      .map((key, value) => MapEntry(key, value ?? ""))))
                .send();
            if (response.statusCode == 200 || response.statusCode == 302) {
              widget.onSuccess();
              setState(() => _inProgress = false);
            } else {
              _onError();
              setState(() => _inProgress = false);
              throw ("${response.statusCode} ${response.request!.url}");
            }
          } catch (e) {
            if (e.toString().contains("XMLHttpRequest error")) {
              widget.onSuccess();
              setState(() => _inProgress = false);
            } else {
              _onError();
              setState(() => _inProgress = false);
              rethrow;
            }
          }
        }
      },
    );
  }

  void _onError() {
    final scaffoldState = ScaffoldMessenger.of(context);
    scaffoldState.showSnackBar(SnackBar(
      content: Text("Unable to send. Please try again later"),
    ));
  }
}
