import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abd/shared/components/components.dart';
import 'package:abd/shared/cubit/cubit.dart';
import 'package:abd/shared/cubit/states.dart';

class ArchivedTasksScreen extends StatefulWidget {
  @override
  _ArchivedTasksScreenState createState() => _ArchivedTasksScreenState();
}

class _ArchivedTasksScreenState extends State<ArchivedTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).archiveTasks;
        return tasksBuilder(tasks: tasks);
      },
    );
  }
}
