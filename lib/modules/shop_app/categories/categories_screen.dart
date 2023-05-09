import 'package:abd/layout/shop_app/cubit/cubit.dart';
import 'package:abd/layout/shop_app/cubit/states.dart';
import 'package:abd/models/shop_app/categories_model.dart';
import 'package:abd/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return ListView.separated(
            itemBuilder: (context, index) =>
                buildCatItem(cubit.categoriesModel!.data!.data![index]),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: cubit.categoriesModel!.data!.data!.length);
      },
    );
  }
}

Widget buildCatItem(DataModel model) => Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Image(
            image: NetworkImage("${model.image}"),
            height: 80,
            width: 80,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            '${model.name}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
