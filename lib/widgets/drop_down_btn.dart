import 'package:chatgpt/constants/constants.dart';
import 'package:flutter/material.dart';

class DropDownBtn extends StatefulWidget {
  const DropDownBtn({super.key});

  @override
  State<DropDownBtn> createState() => _DropDownBtnState();
}

class _DropDownBtnState extends State<DropDownBtn> {
  String currentmodel = 'Model1';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        iconEnabledColor: Colors.white,
        dropdownColor: scaffoldBackgroundColor,
        items: getModelsItem,
        value: currentmodel,
        onChanged: (value) {
          setState(() {
            currentmodel = value.toString();
          });
        });
  }
}
