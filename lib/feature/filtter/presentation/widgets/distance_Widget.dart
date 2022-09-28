import 'package:booking/core/util/blocs/app/cubit.dart';
import 'package:flutter/material.dart';

class DistanceWidget extends StatefulWidget {
  DistanceWidget({
    Key? key,
  }) : super(key: key);
  @override
  State<DistanceWidget> createState() => _DistanceWidgetState();
}

class _DistanceWidgetState extends State<DistanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Distance from city center ',
            style: TextStyle(color: Colors.grey)),
        const SizedBox(
          height: 10,
        ),
        const Center(child: Text('Less than 5.0 Km ')),
        SliderTheme(
          data: const SliderThemeData(
            showValueIndicator: ShowValueIndicator.always,
            thumbColor: Colors.teal,
            trackHeight: 8,
            activeTrackColor: Colors.teal,
            inactiveTrackColor: Colors.grey,
            activeTickMarkColor: Colors.transparent,
            inactiveTickMarkColor: Colors.transparent,
          ),
          child: Slider(
            max: 100,
            min: 1,
            divisions: 20,
            label: AppBloc.get(context).startDistanc.round().toString(),
            onChanged: (values) {
              setState(() {
                AppBloc.get(context).startDistanc = values;
              });
            },
            value: AppBloc.get(context).startDistanc,
          ),
        ),
      ],
    );
  }
}
