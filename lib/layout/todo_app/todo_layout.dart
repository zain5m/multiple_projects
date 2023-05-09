import 'package:abd/shared/components/components.dart';
import 'package:abd/shared/cubit/cubit.dart';
import 'package:abd/shared/cubit/states.dart';
import 'package:conditional_builder/conditional_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeLayout extends StatelessWidget {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();

  var titelcontroller = TextEditingController();
  var timelcontroller = TextEditingController();
  var datecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) => {
                if (state is AppInsertDataBaseState)
                  {
                    Navigator.pop(context),
                  }
              },
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);

            return Scaffold(
              key: scaffoldkey,
              appBar: AppBar(
                title: Text(cubit.title[cubit.currentIndex]),
              ),
              body: ConditionalBuilder(
                  condition: state is! AppGetDataBaseLoadingState,
                  //tasks.length > 0,
                  builder: (context) => cubit.screen[cubit.currentIndex],
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator())),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeIndex(index);
                  //   setState(() {
                  //     currentIndex = index;
                  //   });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.menu),
                    label: 'task',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline),
                    label: 'Done',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined),
                    label: 'Archived',
                  ),
                ],
                type: BottomNavigationBarType.fixed,
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  if (cubit.isBottomSheetShow) {
                    if (formkey.currentState!.validate()) {
                      cubit.insertDatabase(
                          titel: titelcontroller.text,
                          time: timelcontroller.text,
                          date: datecontroller.text);
                    }
                  } else {
                    scaffoldkey.currentState!
                        .showBottomSheet(
                          (context) => Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(20.0),
                            child: Form(
                              key: formkey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  defaultFormField(
                                    controller: titelcontroller,
                                    type: TextInputType.text,
                                    validate: (Value) {
                                      if (Value!.isEmpty) {
                                        return 'titel must not be Embty';
                                      }
                                      return null;
                                    },
                                    label: 'Task Titel',
                                    prefix: Icons.title,
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  defaultFormField(
                                    readOnly: true,
                                    controller: timelcontroller,
                                    type: TextInputType.number,
                                    onTap: () {
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then((value) {
                                        timelcontroller.text =
                                            value!.format(context).toString();
                                      });
                                    },
                                    validate: (Value) {
                                      if (Value!.isEmpty) {
                                        return 'time must not be Embty';
                                      }
                                      return null;
                                    },
                                    label: 'Task Time',
                                    prefix: Icons.watch_later_outlined,
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  defaultFormField(
                                    readOnly: true,
                                    controller: datecontroller,
                                    type: TextInputType.datetime,
                                    onTap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2022-05-20'),
                                      ).then((value) {
                                        datecontroller.text =
                                            DateFormat.yMMMd().format(value!);
                                      });
                                    },
                                    validate: (Value) {
                                      if (Value!.isEmpty) {
                                        return 'date must not be Embty';
                                      }
                                      return null;
                                    },
                                    label: 'Task date',
                                    prefix: Icons.calendar_today,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          elevation: 20.0,
                        )
                        .closed
                        .then((value) {
                      cubit.changeBottomSheetStata(
                          isShow: false, icon: Icons.edit);
                    });
                    cubit.changeBottomSheetStata(isShow: true, icon: Icons.add);
                  }
                },
                child: Icon(cubit.fabIcon),
              ),
            );
          }),
    );
  }

  Future<String> getName() async {
    return 'Ahmail Ali';
  }
}
