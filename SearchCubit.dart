import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/DioHelper.dart';
import 'package:shopapp/SearchModel.dart';
import 'package:shopapp/SearchStates.dart';
import 'package:shopapp/components.dart';
import 'package:shopapp/endpoints.dart';

class SearchCubit extends Cubit<SearchStates>
{
  SearchCubit():super(SearchInitialState());
  static SearchCubit get(context)=>BlocProvider.of(context);
  SearchModel? model;
  void search(String text)
  {
    emit(SearchLoadingState());
    DioHelper.postData(
      url:SEARCH , data: {
      'text':text,
      token:token,
    },).then((value) {
      model=SearchModel.fromJson((value.data));
      emit(SearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SearchErrorState(error));

    });
  }
}