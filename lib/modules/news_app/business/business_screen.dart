import 'package:abd/layout/news_app/cubit/cubit.dart';
import 'package:abd/layout/news_app/cubit/states.dart';
import 'package:abd/shared/components/components.dart';
import 'package:bloc/bloc.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        var list = NewsCubit.get(context).business;
        return articlebuilder(
          list,
          Icons.business,
        );
      },
    );
  }
}
