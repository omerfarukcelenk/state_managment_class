import 'package:flutter/material.dart';

class ProjectInput extends InputDecoration {
  const ProjectInput(String title)
      : super(
            border: const OutlineInputBorder(),
            hintText: title,
            focusColor: Colors.red);
}
