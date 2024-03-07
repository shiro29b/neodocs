import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neodocs/constants.dart';

class TextFieldWidget extends StatelessWidget {
  final int min;
  final int max;
  const TextFieldWidget({super.key, required this.min, required this.max});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
        ],
        decoration: const InputDecoration(border: InputBorder.none),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (value != "") {
            if (double.parse(value) < min || double.parse(value) > max) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Please enter value in range")));
              dataValue.value = 0;
            } else {
              dataValue.value = double.parse(value);
            }
          } else {
            dataValue.value = 0;
          }
        },
      ),
    );
  }
}
