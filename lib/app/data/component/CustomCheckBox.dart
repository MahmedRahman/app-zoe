
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    Key key,
    this.labelCheckBox, this.onChanged,
  }) : super(key: key);

  final String labelCheckBox;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    var stateCheckBox = false.obs;
    return Obx(
      () {
        return CheckboxListTile(
          checkColor: Colors.red,
          title: Text(
            labelCheckBox,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          value: stateCheckBox.value,
          onChanged: (newValue) {
            stateCheckBox.value = newValue;
            onChanged(newValue);
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        );
      },
    );
  }
}
