import 'package:abd/models/shop_app/search_model.dart';
import 'package:abd/modules/shop_app/saerch/cubit/states.dart';
import 'package:abd/shared/components/constants.dart';
import 'package:abd/shared/network/end_points.dart';
import 'package:abd/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? model;

  void search(String text) {
    emit(SearchLoadingState());
    DioHelper.postData(
      url: SEARCH,
      token: token,
      data: {
        'text': text,
      },
    ).then((value) {
      model = SearchModel.fromJson(value.data);
      emit(SearchSccessState());
    }).catchError((e) {
      emit(SearchrErrorState());
    });
  }
}
