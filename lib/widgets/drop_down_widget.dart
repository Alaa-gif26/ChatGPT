import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ModalDropDownWidget extends StatefulWidget {
  const ModalDropDownWidget({super.key});

  @override
  State<ModalDropDownWidget> createState() => _ModalDropDownWidgetState();
}

class _ModalDropDownWidgetState extends State<ModalDropDownWidget> {
  String currentModel = "Model1";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: [],
      value: currentModel,
      onChanged: (value) {
        setState(() {
          currentModel = value.toString();
        });
      },
    );
  }
}