import 'package:booking/core/util/blocs/app/cubit.dart';
import 'package:flutter/material.dart';

class RangSliderWidget extends StatefulWidget {
  RangSliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<RangSliderWidget> createState() => _RangSliderWidgetState();
}

class _RangSliderWidgetState extends State<RangSliderWidget> {
  // final double _x = 10.0;

  // RangeValues currentValues = RangeValues(_x, 2000);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Filtter',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text('price (for 1 night)',
            style: TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: const [
            Text('100', style: TextStyle(fontSize: 14, color: Colors.grey)),
            Spacer(),
            Text('5000', style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
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
          child: RangeSlider(
            max: 5000,
            min: 100,
            values: RangeValues(
                AppBloc.get(context).start, AppBloc.get(context).end),
            divisions: 20,
            labels: RangeLabels(AppBloc.get(context).start.toString(),
                AppBloc.get(context).end.toString()),
            onChanged: (values) {
              setState(() {
                AppBloc.get(context).start = values.start;
                AppBloc.get(context).end = values.end;

                RangeLabels('${AppBloc.get(context).start}',
                    '${AppBloc.get(context).end}');
              });
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
