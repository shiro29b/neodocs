import 'package:flutter/material.dart';
import 'package:neodocs/linear_gauge.dart';
import 'package:neodocs/text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Bar Widget'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 8),
              child: Text("Enter Value"),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: TextFieldWidget(
                min: 0,
                max: 130,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: LinearGauge(
                rangeValues: [
                  Range(start: 0, end: 30, color: Colors.red),
                  Range(start: 30, end: 40, color: Colors.orange),
                  Range(start: 40, end: 60, color: Colors.green),
                  Range(start: 60, end: 70, color: Colors.orange),
                  Range(start: 70, end: 130, color: Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Range {
  final double start;
  final double end;
  final Color color;

  Range({required this.start, required this.end, required this.color});
}
