import 'package:booking/core/util/blocs/app/cubit.dart';
import 'package:booking/core/util/blocs/app/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickDataAndRome extends StatefulWidget {
  const PickDataAndRome({Key? key}) : super(key: key);

  @override
  State<PickDataAndRome> createState() => _PickDataAndRomeState();
}

class _PickDataAndRomeState extends State<PickDataAndRome> {
  DateTime date = DateTime.now();
  int rooms = 0;
  int people = 0;
  @override
  Widget build(BuildContext context) {
    var cubit = AppBloc.get(context);
    return BlocBuilder<AppBloc, AppStates>(
      builder: (context, state) {
        void _showDatePicker(setState) async {
          DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(2021),
              lastDate: DateTime(2023));

          if (newDate == null) return;
          setState(() {
            date = newDate;
          });
        }

        void showDetails() {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Center(child: Text('Room selected')),
                  content: SizedBox(
                    height: 100,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Number of Rooms ',
                              style: TextStyle(fontSize: 12),
                            ),
                            IconButton(
                                onPressed: () {
                                  cubit.sumRooms();
                                },
                                icon: const Icon(Icons.add_circle_outline)),
                            Text('${cubit.rooms}'),
                            IconButton(
                                onPressed: () {
                                  cubit.subtraRooms();
                                },
                                icon: const Icon(Icons.remove_circle_outline)),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('People '),
                            const SizedBox(
                              width: 50,
                            ),
                            IconButton(
                                onPressed: () {
                                  // cubit.sumPeople();
                                },
                                icon: const Icon(Icons.add_circle_outline)),
                            const SizedBox(
                              width: 5,
                            ),
                            Text('${cubit.people}'),
                            const SizedBox(
                              width: 5,
                            ),
                            IconButton(
                                onPressed: () {
                                  //  cubit.subtraPeople();
                                },
                                icon: const Icon(Icons.remove_circle_outline)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    Center(
                        child: TextButton(
                            onPressed: () {}, child: const Text('Apply'))),
                  ],
                );
              });
        }

        return Row(
          children: [
            InkWell(
              onTap: () async {
                _showDatePicker(setState);
              },
              child: Column(
                children: [
                  const Text(
                    'choose Data',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('${date.day}/${date.month}/${date.year}'),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 8,
            ),
            Container(
              color: Colors.grey,
              width: 1.5,
              height: MediaQuery.of(context).size.height / 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 15,
            ),
            InkWell(
              onTap: () {
                showDetails();
              },
              child: Column(
                children: [
                  const Text('Number of Rooms',
                      style: TextStyle(color: Colors.grey)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('${cubit.rooms} Room' '   ' '${cubit.people} people '),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
