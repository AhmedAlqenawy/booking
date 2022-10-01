import 'package:booking/core/util/blocs/app/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/facilities.dart';

class FacilitiesWidget extends StatelessWidget {
  const FacilitiesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Populer filtter ', style: TextStyle(color: Colors.grey)),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent:50
                  //crossAxisSpacing: 5.0,
                  //mainAxisSpacing: 5.0,
              ),
                itemCount: AppBloc.get(context).allFacilities?.data!.length,
                itemBuilder: (context, ind) => asd(
                      facility: AppBloc.get(context).allFacilities!.data![ind],
                    )),
          ),
        ],
      ),
    );
  }
}

class asd extends StatefulWidget {
  final Facility facility;

  asd({Key? key, required this.facility}) : super(key: key);

  @override
  State<asd> createState() => _asdState();
}

class _asdState extends State<asd> {
  bool value = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    value=AppBloc.get(context).facilitiesIds.contains(widget.facility.id!);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.4,
      child: CheckboxListTile(
        activeColor: Colors.teal,
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          widget.facility.name ?? "",
          style: const TextStyle(fontSize: 12),
        ),
        value: value,
        onChanged: (val) {
          if(value==false) {
            AppBloc.get(context).addFacilitiesToFilter(widget.facility.id!);
          } else {
            AppBloc.get(context).removeFacilitiesToFilter(widget.facility.id!);
          }
          setState(() {
            value = val!;
          });

        },
      ),
    );
  }
}
