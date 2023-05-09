import 'package:abd/modules/shop_app/favorites/favorites_screen.dart';
import 'package:abd/modules/shop_app/saerch/cubit/cubit.dart';
import 'package:abd/modules/shop_app/saerch/cubit/states.dart';
import 'package:abd/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class SaerchScreen extends StatelessWidget {
//   SaerchScreen({Key? key}) : super(key: key);
//   var fromkey = GlobalKey<FormState>();
//   var searchController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => SearchCubit(),
//       child: BlocConsumer<SearchCubit, SearchStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return Scaffold(
//             appBar: AppBar(),
//             body: Form(
//               key: fromkey,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     defaultFormField(
//                       controller: searchController,
//                       type: TextInputType.text,
//                       // onChanged: (p0) {
//                       //   SearchCubit.get(context).search(p0);
//                       // },
//                       onSubmit: (text) {
//                         SearchCubit.get(context).search(text);
//                       },
//                       validate: (value) {
//                         if (value!.isEmpty) {
//                           return 'enter text text to search';
//                         }
//                         return null;
//                       },
//                       label: 'Search',
//                       prefix: Icons.search,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     if (state is SearchLoadingState) LinearProgressIndicator(),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     if (state is SearchSccessState)
//                       Expanded(
//                         child: ListView.separated(
//                           itemBuilder: (context, index) => buildListproduct(
//                             SearchCubit.get(context).model!.data!.data!.length,
//                             context,
//                             isOldPrice: false,
//                           ),
//                           separatorBuilder: (context, index) => myDivider(),
//                           itemCount: SearchCubit.get(context)
//                               .model!
//                               .data!
//                               .data!
//                               .length,
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class SaerchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultFormField(
                      controller: searchController,
                      type: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'enter text to search';
                        }

                        return null;
                      },
                      onSubmit: (String text) {
                        SearchCubit.get(context).search(text);
                      },
                      label: 'Search',
                      prefix: Icons.search,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    if (state is SearchLoadingState) LinearProgressIndicator(),
                    SizedBox(
                      height: 10.0,
                    ),
                    if (state is SearchSccessState)
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => buildListproduct(
                            SearchCubit.get(context).model!.data!.data![index],
                            context,
                            isOldPrice: false,
                          ),
                          separatorBuilder: (context, index) => myDivider(),
                          itemCount: SearchCubit.get(context)
                              .model!
                              .data!
                              .data!
                              .length,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
