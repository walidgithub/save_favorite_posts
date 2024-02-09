part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetAllPostsEvent extends SearchEvent {}

class GetPostsByWebsiteEvent extends SearchEvent {
  final PostsByWebsiteRequest postsByWebsiteRequest;

  const GetPostsByWebsiteEvent(this.postsByWebsiteRequest);

  List<Object> get props => [postsByWebsiteRequest];
}

class GetPostsBySubCategoryEvent extends SearchEvent {
  final PostsBySubCategoryRequest postsBySubCategoryRequest;

  const GetPostsBySubCategoryEvent(this.postsBySubCategoryRequest);

  List<Object> get props => [postsBySubCategoryRequest];
}

class GetPostsBySubCategoryNWebsiteEvent extends SearchEvent {
  final PostsBySubCategoryNWebsiteRequest postsBySubCategoryNWebsiteRequest;

  const GetPostsBySubCategoryNWebsiteEvent(this.postsBySubCategoryNWebsiteRequest);

  List<Object> get props => [postsBySubCategoryNWebsiteRequest];
}

class GetPostsByDescEvent extends SearchEvent {
  final PostsByDescRequest postsByDescRequest;

  const GetPostsByDescEvent(this.postsByDescRequest);

  List<Object> get props => [postsByDescRequest];
}

class GetPostsByDescNWebsiteEvent extends SearchEvent {
  final PostsByDescNWebsiteRequest postsByDescNWebsiteRequest;

  const GetPostsByDescNWebsiteEvent(this.postsByDescNWebsiteRequest);

  List<Object> get props => [postsByDescNWebsiteRequest];
}

class GetPostsByDescNSubCategoryEvent extends SearchEvent {
  final PostsByDescNSubCategoryRequest postsByDescNSubCategoryRequest;

  const GetPostsByDescNSubCategoryEvent(this.postsByDescNSubCategoryRequest);

  List<Object> get props => [postsByDescNSubCategoryRequest];
}

class GetPostsByDescNSubCategoryNWebsiteEvent extends SearchEvent {
  final PostsByDescNSubCategoryNWebsiteRequest postsByDescNSubCategoryNWebsiteRequest;

  const GetPostsByDescNSubCategoryNWebsiteEvent(this.postsByDescNSubCategoryNWebsiteRequest);

  List<Object> get props => [postsByDescNSubCategoryNWebsiteRequest];
}

class GetPostsByDescNCategoryEvent extends SearchEvent {
  final PostsByDescNCategoryRequest postsByDescNCategoryRequest;

  const GetPostsByDescNCategoryEvent(this.postsByDescNCategoryRequest);

  List<Object> get props => [postsByDescNCategoryRequest];
}

class GetPostsByDescNCategoryNWebsiteEvent extends SearchEvent {
  final PostsByDescNCategoryNWebsiteRequest postsByDescNCategoryNWebsiteRequest;

  const GetPostsByDescNCategoryNWebsiteEvent(this.postsByDescNCategoryNWebsiteRequest);

  List<Object> get props => [postsByDescNCategoryNWebsiteRequest];
}

class GetPostsByDescNCategoryNSubCategoryEvent extends SearchEvent {
  final PostsByDescNCategoryNSubCategoryRequest postsByDescNCategoryNSubCategoryRequest;

  const GetPostsByDescNCategoryNSubCategoryEvent(this.postsByDescNCategoryNSubCategoryRequest);

  List<Object> get props => [postsByDescNCategoryNSubCategoryRequest];
}

class GetPostsByDescNCategoryNSubCategoryNWebsiteEvent extends SearchEvent {
  final PostsByDescNCategoryNSubCategoryNWebsiteRequest postsByDescNCategoryNSubCategoryNWebsiteRequest;

  const GetPostsByDescNCategoryNSubCategoryNWebsiteEvent(this.postsByDescNCategoryNSubCategoryNWebsiteRequest);

  List<Object> get props => [postsByDescNCategoryNSubCategoryNWebsiteRequest];
}

class GetPostsByCategoryEvent extends SearchEvent {
  final PostsByCategoryRequest postsByCategoryRequest;

  const GetPostsByCategoryEvent(this.postsByCategoryRequest);

  List<Object> get props => [postsByCategoryRequest];
}

class GetPostsByCategoryNWebsiteEvent extends SearchEvent {
  final PostsByCategoryNWebsiteRequest postsByCategoryNWebsiteRequest;

  const GetPostsByCategoryNWebsiteEvent(this.postsByCategoryNWebsiteRequest);

  List<Object> get props => [postsByCategoryNWebsiteRequest];
}

class GetPostsByCategoryNSubCategoryEvent extends SearchEvent {
  final PostsByCategoryNSubCategoryRequest postsByCategoryNSubCategoryRequest;

  const GetPostsByCategoryNSubCategoryEvent(this.postsByCategoryNSubCategoryRequest);

  List<Object> get props => [postsByCategoryNSubCategoryRequest];
}

class GetPostsByCategoryNSubCategoryNWebsiteEvent extends SearchEvent {
  final PostsByCategoryNSubCategoryNWebsiteRequest postsByCategoryNSubCategoryNWebsiteRequest;

  const GetPostsByCategoryNSubCategoryNWebsiteEvent(this.postsByCategoryNSubCategoryNWebsiteRequest);

  List<Object> get props => [postsByCategoryNSubCategoryNWebsiteRequest];
}