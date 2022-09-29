import 'package:booking/core/util/blocs/app/cubit.dart';
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
            onPressed: () {
              AppBloc.get(context).searchHotel(name: controller.text);
            },
            icon: const Icon(Icons.search),
          ),
        ),
      ],
    );
  }
}
