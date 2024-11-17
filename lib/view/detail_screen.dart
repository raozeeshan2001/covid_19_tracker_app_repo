import 'package:covid_tracker_app/view/world_states.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String countryname, image;
  int totalcases,
      totaldeaths,
      totalrecovered,
      active,
      critical,
      todayrecovered,
      test;
  DetailScreen({
    required this.countryname,
    required this.image,
    required this.totalcases,
    required this.totaldeaths,
    required this.totalrecovered,
    required this.active,
    required this.critical,
    required this.todayrecovered,
    required this.test,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.countryname),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Card(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(widget.image),
                  ),
                  Reusable_Row(
                      title: 'cases', value: widget.totalcases.toString()),
                  Reusable_Row(
                      title: 'total deaths',
                      value: widget.totaldeaths.toString()),
                  Reusable_Row(
                      title: 'total recovered',
                      value: widget.totalrecovered.toString()),
                  Reusable_Row(
                      title: 'active', value: widget.active.toString()),
                  Reusable_Row(
                      title: 'critical', value: widget.critical.toString()),
                  Reusable_Row(
                      title: 'today recovered',
                      value: widget.todayrecovered.toString()),
                  Reusable_Row(title: 'tests', value: widget.test.toString()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
