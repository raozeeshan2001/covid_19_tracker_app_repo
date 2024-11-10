import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStates extends StatefulWidget {
  const WorldStates({super.key});

  @override
  State<WorldStates> createState() => _WorldStatesState();
}

class _WorldStatesState extends State<WorldStates>
    with TickerProviderStateMixin {
  late AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            PieChart(
              dataMap: {
                "Total": 20,
                "Recovered": 50,
                "Deaths": 10,
              },
              chartType: ChartType.ring,
              animationDuration: Duration(milliseconds: 1200),
              colorList: colorList,
              chartRadius: MediaQuery.of(context).size.width / 3.2,
              legendOptions: LegendOptions(legendPosition: LegendPosition.left),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.06),
              child: Card(
                child: Column(
                  children: [
                    Reusable_Row(title: 'name', value: 'rao'),
                    Reusable_Row(title: 'name', value: 'rao'),
                    Reusable_Row(title: 'name', value: 'rao'),
                    Reusable_Row(title: 'name', value: 'rao'),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xff1aa260),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text('Track Countries')),
            )
          ],
        ),
      )),
    );
  }
}

class Reusable_Row extends StatelessWidget {
  Reusable_Row({super.key, required this.title, required this.value});
  String title, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(),
        ],
      ),
    );
  }
}
