import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

Widget buildTextField(
  String label,
  String name, {
  bool isMultiline = false,
  TextEditingController? controller,
}) {
  return FormBuilderTextField(
    controller: controller,
    name: name,
    decoration: InputDecoration(
      labelText: label,
      fillColor: Colors.white,
      border: const OutlineInputBorder(),
    ),
    validator: FormBuilderValidators.required(context),
    maxLines: isMultiline ? 3 : 1,
  );
}

class FormBuilderValidators {
  static required(context) {}
}
