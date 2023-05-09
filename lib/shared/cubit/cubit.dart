import 'package:abd/modules/todo_app/archived_tasks/archived_tasks_screen.dart';
import 'package:abd/modules/todo_app/done_tasks/done_tasks_screen.dart';
import 'package:abd/modules/todo_app/new_tasks/new_task_screen.dart';
import 'package:abd/shared/cubit/states.dart';
import 'package:abd/shared/network/local/cache_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screen = [
    NewTaskScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> title = [
    'TASK',
    'DONE',
    'ARCHIVED',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNabBarState());
  }

  Database? database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        //  print('database create');
        database
            .execute(
                'CREATE TABLE task (id INTEGER PRIMARY KEY, title TEXT ,date TEXT,time TEXT,status TEXT)')
            .then(
          (value) {
            //    print('table create');
          },
        ).catchError(
          (e) {
            print(e);
          },
        );
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        // print('database open');
      },
    ).then((value) {
      database = value;
      emit(AppCreatDataBaseState());
    });
  }

  insertDatabase(
      {required String titel, required String time, required date}) async {
    await database!.transaction((txn) async {
      txn
          .rawInsert(
        'INSERT INTO task(title, date, time,status) VALUES("$titel", "$date","$time","new")',
      )
          .then(
        (value) {
          emit(AppInsertDataBaseState());
          getDataFromDatabase(database);
          // print(value);
          // print('insert successfully');
        },
      ).catchError(
        (e) {
          print(e);
        },
      );
    });
  }

  void getDataFromDatabase(database) async {
    newTasks = [];
    doneTasks = [];
    archiveTasks = [];

    emit(AppGetDataBaseLoadingState());
    database.rawQuery('SELECT * FROM task').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else {
          archiveTasks.add(element);
        }
      });
      emit(AppGetDataBaseState());
    });
  }

  void updateDatabase({
    required String status,
    required int id,
  }) {
    database!.rawUpdate('UPDATE task SET status = ?  WHERE id = ?',
        ['$status', id]).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDataBaseState());
    });
  }

  void deleteDatabase({
    required int id,
  }) {
    database!.rawUpdate('DELETE FROM task WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDataBaseState());
    });
  }

  bool isBottomSheetShow = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetStata({required bool isShow, required IconData icon}) {
    isBottomSheetShow = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }

  bool isDark = false;

  void changeAppMode({ismode}) {
    if (ismode != null) {
      isDark = ismode;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBooleane(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }
}
