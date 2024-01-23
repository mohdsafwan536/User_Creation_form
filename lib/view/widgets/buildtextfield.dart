import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

Widget buildTextField(
    String label,
    String name, {
      bool isMultiline = false,
      TextEditingController? controller,
      bool isRequired = false,
    }) {
  return FormBuilderTextField(
    controller: controller,
    name: name,
    decoration: InputDecoration(
      labelText: label,
      fillColor: Colors.white,
      border: const OutlineInputBorder(),
    ),
    validator: isRequired ? FormBuilderValidators.required : null,
    maxLines: isMultiline ? 3 : 1,
  );
}

class FormBuilderValidators {
  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}
