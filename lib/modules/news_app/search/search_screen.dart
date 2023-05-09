import 'package:abd/layout/news_app/cubit/cubit.dart';
import 'package:abd/layout/news_app/cubit/states.dart';
import 'package:abd/shared/components/components.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: defaultFormField(
              controller: context.read<NewsCubit>().searchController,
              type: TextInputType.name,
              onChanged: (value) {
                print(value);
                context.read<NewsCubit>().getSearch(value);
              },
              validate: (value) {
                if (value!.isEmpty) {
                  return 'search must not be Empty';
                }
                print(value);
                return null;
              },
              label: 'search',
              prefix: Icons.search,
            ),
          ),
          BlocSelector<NewsCubit, NewsStates, Widget>(
            selector: (state) {
              var list = context.read<NewsCubit>().search;
              return Expanded(
                child: Text('ss'),
              );
            },
            builder: (context, state) {
              var list = context.read<NewsCubit>().search;
              return Expanded(
                child: articlebuilder(
                  list,
                  Icons.search,
                  isSearchSCreen: true,
                ),
              );
            },
          ),

          // BlocConsumer<NewsCubit, NewsStates>(
          //     listener: (context, state) {},
          //     builder: (context, state) {
          //       var list = context.read<NewsCubit>().search;
          //       return Expanded(
          //         child: articlebuilder(
          //           list,
          //           Icons.search,
          //           isSearchSCreen: true,
          //         ),
          //       );
          //     }),
        ],
      ),
    );
  }
}
