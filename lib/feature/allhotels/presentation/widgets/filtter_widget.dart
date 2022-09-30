import 'package:booking/core/util/blocs/app/cubit.dart';
import 'package:booking/core/util/blocs/app/states.dart';
import 'package:booking/feature/filtter/presentation/filtter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/blocs/app/cubit.dart';

class FiltterWidget extends StatelessWidget {
  const FiltterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppStates>(
      builder: (context, state) {
        if (state is HotelsSuccessState) {
          return Row(
            children: [
              Text('${AppBloc.get(context).hotel.length}' '  ' 'Hotel Found'),
              const Spacer(),
              const Text(
                'Filtter',
              ),
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
        } else if (state is FiltterSuccessState) {
          return Row(
            children: [
              Text('${AppBloc.get(context).filtterHotel.length}'
                  '  '
                  'Hotel Found'),
              const Spacer(),
              const Text(
                'Filtter',
              ),
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
        } else if (state is SearchSuccessState) {
          return Row(
            children: [
              Text('${AppBloc.get(context).search.length}' '  ' 'Hotel Found'),
              const Spacer(),
              const Text(
                'Filtter',
              ),
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
        } else {
          return Row(
            children: [
              Text('${AppBloc.get(context).search.length}' '  ' 'Hotel Found'),
              const Spacer(),
              const Text(
                'Filtter',
              ),
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
      },
    );
  }
}
