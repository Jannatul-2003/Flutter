import 'package:flutter/material.dart';

import 'package:roll_dice/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(255, 236, 183, 192),
          Color.fromARGB(255, 215, 112, 173),
        ),
        //GradientContainer.purple(),
      ),
    ),
  );
}
