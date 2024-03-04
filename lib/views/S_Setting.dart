import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  double d1 = 10;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 200,
          width: 1000,
          child: PieChart(
            dataMap: {'key': d1, 'blue': 25, 'black': 50},
            chartType: ChartType.ring,
            emptyColor: Colors.white,
            colorList: const [Colors.white, Colors.red, Colors.orange],
            ringStrokeWidth: 10,
          ),
        ),
        Slider(
          value: d1,
          onChanged: (double) {
            setState(() {
              d1 = double;
            });
          },
          max: 128,
          min: 8,
        ),
        Text('${d1.toInt()}'),
      ],
    );
  }
}
