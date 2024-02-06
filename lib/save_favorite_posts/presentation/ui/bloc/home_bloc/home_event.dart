part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetAllPostsEvent extends HomeEvent {}

class GetPostsByWebsiteEvent extends HomeEvent {
  final PostsByWebsiteRequest postsByWebsiteRequest;

  const GetPostsByWebsiteEvent(this.postsByWebsiteRequest);

  List<Object> get props => [postsByWebsiteRequest];
}

class GetPostsBySubCategoryEvent extends HomeEvent {
  final PostsBySubCategoryRequest postsBySubCategoryRequest;

  const GetPostsBySubCategoryEvent(this.postsBySubCategoryRequest);

  List<Object> get props => [postsBySubCategoryRequest];
}

class GetPostsBySubCategoryNWebsiteEvent extends HomeEvent {
  final PostsBySubCategoryNWebsiteRequest postsBySubCategoryNWebsiteRequest;

  const GetPostsBySubCategoryNWebsiteEvent(this.postsBySubCategoryNWebsiteRequest);

  List<Object> get props => [postsBySubCategoryNWebsiteRequest];
}

class GetPostsByDescEvent extends HomeEvent {
  final PostsByDescRequest postsByDescRequest;

  const GetPostsByDescEvent(this.postsByDescRequest);

  List<Object> get props => [postsByDescRequest];
}

class GetPostsByDesNWebsiteEvent extends HomeEvent {
  final PostsByDesNWebsiteRequest postsByDesNWebsiteRequest;

  const GetPostsByDesNWebsiteEvent(this.postsByDesNWebsiteRequest);

  List<Object> get props => [postsByDesNWebsiteRequest];
}

class GetPostsByDescNSubCategoryEvent extends HomeEvent {
  final PostsByDescNSubCategoryRequest postsByDescNSubCategoryRequest;

  const GetPostsByDescNSubCategoryEvent(this.postsByDescNSubCategoryRequest);

  List<Object> get props => [postsByDescNSubCategoryRequest];
}

class GetPostsByDescNSubCategoryNWebsiteEvent extends HomeEvent {
  final PostsByDescNSubCategoryNWebsiteRequest postsByDescNSubCategoryNWebsiteRequest;

  const GetPostsByDescNSubCategoryNWebsiteEvent(this.postsByDescNSubCategoryNWebsiteRequest);

  List<Object> get props => [postsByDescNSubCategoryNWebsiteRequest];
}

class GetPostsByDescNCategoryEvent extends HomeEvent {
  final PostsByDescNCategoryRequest postsByDescNCategoryRequest;

  const GetPostsByDescNCategoryEvent(this.postsByDescNCategoryRequest);

  List<Object> get props => [postsByDescNCategoryRequest];
}

class GetPostsByDescNCategoryNWebsiteEvent extends HomeEvent {
  final PostsByDescNCategoryNWebsiteRequest postsByDescNCategoryNWebsiteRequest;

  const GetPostsByDescNCategoryNWebsiteEvent(this.postsByDescNCategoryNWebsiteRequest);

  List<Object> get props => [postsByDescNCategoryNWebsiteRequest];
}

class GetPostsByDescNCategoryNSubCategoryEvent extends HomeEvent {
  final PostsByDescNCategoryNSubCategoryRequest postsByDescNCategoryNSubCategoryRequest;

  const GetPostsByDescNCategoryNSubCategoryEvent(this.postsByDescNCategoryNSubCategoryRequest);

  List<Object> get props => [postsByDescNCategoryNSubCategoryRequest];
}

class GetPostsByDescNCategoryNSubCategoryNWebsiteEvent extends HomeEvent {
  final PostsByDescNCategoryNSubCategoryNWebsiteRequest postsByDescNCategoryNSubCategoryNWebsiteRequest;

  const GetPostsByDescNCategoryNSubCategoryNWebsiteEvent(this.postsByDescNCategoryNSubCategoryNWebsiteRequest);

  List<Object> get props => [postsByDescNCategoryNSubCategoryNWebsiteRequest];
}

class GetPostsByCategoryEvent extends HomeEvent {
  final PostsByCategoryRequest postsByCategoryRequest;

  const GetPostsByCategoryEvent(this.postsByCategoryRequest);

  List<Object> get props => [postsByCategoryRequest];
}

class GetPostsByCategoryNWebsiteEvent extends HomeEvent {
  final PostsByCategoryNWebsiteRequest postsByCategoryNWebsiteRequest;

  const GetPostsByCategoryNWebsiteEvent(this.postsByCategoryNWebsiteRequest);

  List<Object> get props => [postsByCategoryNWebsiteRequest];
}

class GetPostsByCategoryNSubCategoryEvent extends HomeEvent {
  final PostsByCategoryNSubCategoryRequest postsByCategoryNSubCategoryRequest;

  const GetPostsByCategoryNSubCategoryEvent(this.postsByCategoryNSubCategoryRequest);

  List<Object> get props => [postsByCategoryNSubCategoryRequest];
}

class GetPostsByCategoryNSubCategoryNWebsiteEvent extends HomeEvent {
  final PostsByCategoryNSubCategoryNWebsiteRequest postsByCategoryNSubCategoryNWebsiteRequest;

  const GetPostsByCategoryNSubCategoryNWebsiteEvent(this.postsByCategoryNSubCategoryNWebsiteRequest);

  List<Object> get props => [postsByCategoryNSubCategoryNWebsiteRequest];
}