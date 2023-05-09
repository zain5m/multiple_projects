import 'package:abd/layout/news_app/cubit/cubit.dart';
import 'package:abd/layout/news_app/cubit/states.dart';
import 'package:abd/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        var list = NewsCubit.get(context).sports;
        return articlebuilder(
          list,
          Icons.sports,
        );
      },
    );
  }
}
