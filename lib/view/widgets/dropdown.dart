import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

Widget buildDropdownForm({
  required String label,
  required String name,
  required List<String> items,
  String? selectedValue,
Function(String?)? onChan,

}) {
  return FormBuilderDropdown(
    name: name,
    decoration: InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
    ),
    onChanged: onChan,
    items: items.map((type) {
      return DropdownMenuItem(
        value: type,
        child: Text(type),
      );
    }).toList(),
  );
}