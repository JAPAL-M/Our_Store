part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  @override
  List<Object> get props => [];
  const SearchState();
}

class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}
class SearchSuccess extends SearchState {
  final List<Products> products;
  const SearchSuccess(this.products);
}
class SearchFailure extends SearchState {
  final String errmessage;
  const SearchFailure(this.errmessage);
}
