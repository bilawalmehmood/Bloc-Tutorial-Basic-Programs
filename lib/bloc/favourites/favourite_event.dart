import 'package:bloc_prectice/model/favourite_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class FetchFavouriteList extends FavouriteEvent {}

class UpdateFavouriteStatus extends FavouriteEvent {
  final FavouriteModel item;
  const UpdateFavouriteStatus(this.item);

  @override
  List<Object> get props => [item];
}

class UpdateSelectedStatus extends FavouriteEvent {
  final FavouriteModel item;
  const UpdateSelectedStatus(this.item);

  @override
  List<Object> get props => [item];
}

class DeleteFavourite extends FavouriteEvent {}
