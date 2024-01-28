part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetTestEvent extends HomeEvent {}

class SearchTestEvent extends HomeEvent {
  final String searchTitle;

  const SearchTestEvent(this.searchTitle);

  List<Object> get props => [searchTitle];
}