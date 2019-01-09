import 'package:flutter/material.dart';
import 'package:unit_converter/style/style.dart';
import 'package:unit_converter/widget/dropdown_border.dart';

class InputSection extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  String getInputtedText() {
    return _textController.text;
  }

  void setTextToTextField(String newText) {
    _textController.text = newText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.go,
            style: defaultTextStyle(),
            controller: _textController,
            decoration: InputDecoration(
                hintText: "Value",
                labelText: "Input Value",
                labelStyle: defaultLabelTextStyle(),
                hintStyle: defaultHintTextStyle(),
                contentPadding: EdgeInsets.all(16),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: Colors.white, width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: Colors.white, width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: Colors.white, width: 2)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: Colors.white54, width: 1))),
          ),
          SizedBox(height: 16),
          DropdownBorder(borderColor: Colors.white, width: 1, radius: 4)
        ]));
  }
}
