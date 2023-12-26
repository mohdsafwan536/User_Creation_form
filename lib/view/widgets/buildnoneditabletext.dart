import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

Widget buildNonEditableText(List<String> lines) {
  // Concatenate the lines to form a multiline string
  String text = lines.join('\n');

  return FormBuilderTextField(
    name: 'nonEditableText',
    initialValue: text,
    readOnly: true,
    decoration: InputDecoration(
      fillColor: Colors.grey[200],
      filled: true,
      border: const OutlineInputBorder(),
    ),
    maxLines: null, // Set to null for dynamic multiline content
  );
}
