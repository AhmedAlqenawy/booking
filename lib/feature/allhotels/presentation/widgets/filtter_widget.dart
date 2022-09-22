import 'package:booking/feature/filtter/presentation/filtter_page.dart';
import 'package:flutter/material.dart';

class FiltterWidget extends StatelessWidget {
  const FiltterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          '7' '  ' 'Hotel Found',
          style: TextStyle(color: Colors.black),
        ),
        const Spacer(),
        const Text('Filtter', style: TextStyle(color: Colors.black)),
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FiltterPage()));
            },
            icon: const Icon(
              Icons.filter_list_outlined,
              color: Colors.teal,
            ))
      ],
    );
  }
}
