import 'package:booking/core/util/widgets/formField/search_text_filed.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MYSearchFormField(controller: controller),
        SizedBox(
          width: MediaQuery.of(context).size.width / 40,
        ),
        FloatingActionButton(
          backgroundColor: Colors.teal,
          onPressed: () {},
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ),
      ],
    );
  }
}
