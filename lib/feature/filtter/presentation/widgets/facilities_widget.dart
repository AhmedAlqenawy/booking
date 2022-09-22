import 'package:flutter/material.dart';

class FacilitiesWidget extends StatelessWidget {
  const FacilitiesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Populer filtter ', style: TextStyle(color: Colors.grey)),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2.4,
              child: CheckboxListTile(
                activeColor: Colors.teal,
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text(
                  'Free wifi',
                  style: TextStyle(fontSize: 12),
                ),
                value: false,
                onChanged: (value) {},
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.2,
              child: CheckboxListTile(
                activeColor: Colors.teal,
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text(
                  'Free wifi',
                  style: TextStyle(fontSize: 12),
                ),
                value: false,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2.4,
              child: CheckboxListTile(
                activeColor: Colors.teal,
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text(
                  'Free wifi',
                  style: TextStyle(fontSize: 12),
                ),
                value: false,
                onChanged: (value) {},
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.2,
              child: CheckboxListTile(
                activeColor: Colors.teal,
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text(
                  'Free wifi',
                  style: TextStyle(fontSize: 12),
                ),
                value: false,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
