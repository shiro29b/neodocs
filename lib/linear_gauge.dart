import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neodocs/constants.dart';
import 'package:neodocs/home_screen.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class LinearGauge extends StatelessWidget {
  final List<Range> rangeValues;
  const LinearGauge({
    super.key,
    required this.rangeValues,
  });

  @override
  Widget build(BuildContext context) {
    List<LinearGaugeRange> ranges = [];

    for (int i = 0; i < rangeValues.length; i++) {
      if (i == 0) {
        ranges.add(
          LinearGaugeRange(
            edgeStyle: LinearEdgeStyle.startCurve,
            startValue: rangeValues[i].start,
            endValue: rangeValues[i].end,
            startWidth: 10,
            midWidth: 10,
            endWidth: 10,
            color: rangeValues[i].color,
          ),
        );
      } else if (i == rangeValues.length - 1) {
        ranges.add(LinearGaugeRange(
          edgeStyle: LinearEdgeStyle.endCurve,
          startValue: rangeValues[i].start,
          endValue: rangeValues[i].end,
          startWidth: 10,
          midWidth: 10,
          endWidth: 10,
          color: rangeValues[i].color,
        ));
      } else {
        ranges.add(LinearGaugeRange(
          startValue: rangeValues[i].start,
          endValue: rangeValues[i].end,
          startWidth: 10,
          midWidth: 10,
          endWidth: 10,
          color: rangeValues[i].color,
        ));
      }
    }
    return Obx(() => SfLinearGauge(
          showTicks: false,
          showAxisTrack: false,
          onGenerateLabels: () {
            List<LinearAxisLabel> labels = rangeValues
                .map(
                  (e) => LinearAxisLabel(
                      text: e.start.toInt().toString(), value: e.start),
                )
                .toList();
            labels.add(LinearAxisLabel(
                text: rangeValues.last.end.toInt().toString(),
                value: rangeValues.last.end));

            return labels;
          },
          minimum: rangeValues[0].start,
          maximum: rangeValues.last.end,
          markerPointers: [
            LinearWidgetPointer(
                value: dataValue.value,
                child: Column(
                  children: [
                    CustomPaint(
                      size: const Size(15, 15),
                      painter: TrianglePainter(),
                    ),
                    Text(dataValue.value.toString())
                  ],
                ))
          ],
          ranges: ranges,
        ));
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
