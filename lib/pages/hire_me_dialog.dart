import 'package:alkebuware_website/widgets/dialog.dart';
import 'package:alkebuware_website/widgets/dropdown_form_field.dart';
import 'package:alkebuware_website/widgets/send_button.dart';
import 'package:alkebuware_website/widgets/send_success.dart';
import 'package:alkebuware_website/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class HireMeDialog extends StatefulWidget {
  static const String routeName = "/hire-an-expert";

  @override
  _HireMeDialogState createState() => _HireMeDialogState();
}

class _HireMeDialogState extends State<HireMeDialog> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  BudgetRange? _budgetRange;
  String? _description;
  bool _sendSucceeded = false;

  @override
  Widget build(BuildContext context) {
    return ADialog(
      title: "Hire an Expert",
      child: Form(
        key: _formKey,
        child: _sendSucceeded == true
            ? SendSuccess()
            : Column(mainAxisSize: MainAxisSize.min, children: [
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
          ADropdownFormField(
            labelText: "Budget Range*",
            onSaved: (range) {
              _budgetRange = range;
            },
            validator: (value) {
              if (value == null) {
                return "Please select a budget range";
              }
              return null;
            },
            stringify: budgetRangeToString,
            items: BudgetRange.values,
          ),
          ATextFormField(
            labelText: "Project Description*",
            minLines: 3,
            maxLines: 5,
            validator: (value) {
              if (value.isEmpty) {
                return "Please tell me about your idea";
              }
              return null;
            },
            onSaved: (value) {
              _description = value;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SubmitFormButton(
                  onSuccess: () {
                    setState(() => _sendSucceeded = true);
                  },
                  type: FormType.hireMe,
                  formKey: _formKey,
                  formData: () => {
                    "name": _name,
                    "email": _email,
                    "budgetRange": budgetRangeToString(_budgetRange),
                    "description": _description,
                  },
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

String? budgetRangeToString(BudgetRange? range) {
  switch (range) {
    case BudgetRange.twentyKToThirtyK:
      return "\$20,000 - \$30,000";
    case BudgetRange.thirtyKToFiftyK:
      return "\$30,000 - \$50,000";
    case BudgetRange.fiftyKPlus:
      return "\$50,000+";
    case null:
      return null;
  }
}

enum BudgetRange {
  twentyKToThirtyK,
  thirtyKToFiftyK,
  fiftyKPlus,
}
