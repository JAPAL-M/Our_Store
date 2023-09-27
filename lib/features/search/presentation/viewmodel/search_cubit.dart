import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_store/core/errors/failures.dart';
import 'package:our_store/features/search/data/repo/search_repo.dart';

import '../../../home/data/models/HomeModel.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchRepo) : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);
  final SearchRepo _searchRepo;

  TextEditingController searchText = TextEditingController();

  Future<void> searchProduct() async{
    emit(SearchLoading());
    var data = await _searchRepo.searchProduct(searchText: searchText.text);

    data.fold((fail){
      emit(SearchFailure(fail.errMessage));
    }, (products){
      emit(SearchSuccess(products));
    });
  }
}
