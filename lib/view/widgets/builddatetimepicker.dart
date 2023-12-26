import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

Widget buildDateTimePicker(String label, String name, {required TextEditingController? controller}) {
  return FormBuilderDateTimePicker(
    controller: controller,
    name: name,
    inputType: InputType.date,
    decoration: InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
    ),
  );
}
