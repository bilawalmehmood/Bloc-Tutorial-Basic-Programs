import 'dart:math';

import 'package:bloc_prectice/bloc/favourites/favourite_event.dart';
import 'package:bloc_prectice/bloc/favourites/favourite_state.dart';
import 'package:bloc_prectice/enums/status.dart';
import 'package:bloc_prectice/model/favourite_model.dart';
import 'package:bloc_prectice/repository/favourite_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState>{
  final List<String> favourites = [];
  final FavouriteRepository favouriteRepository;
  FavouriteBloc(this.favouriteRepository) : super(const FavouriteState(status: Status.loading)){
    on<FetchFavouriteList>(_onFetchFavouriteList);
    on<UpdateFavouriteStatus>(_onUpdateFavouriteStatus);
    on<UpdateSelectedStatus>(_onUpdateSelectedStatus);
  }

  void _onFetchFavouriteList(FetchFavouriteList event, Emitter<FavouriteState> emit) async{
    final favouriteList = await favouriteRepository.fetchFavourite();
    emit(state.copyWith(favourites: favouriteList, status: Status.success));
  }

  void _onUpdateFavouriteStatus(UpdateFavouriteStatus event, Emitter<FavouriteState> emit) {
    emit(state.copyWith(status: Status.loading));
    final index = state.favourites.indexWhere((element) => element.id == event.item.id);
    final updatedFavourite = state.favourites[index].copyWith(isFavourite: !state.favourites[index].isFavourite);
    final updatedFavourites = List<FavouriteModel>.from(state.favourites)..[index] = updatedFavourite;
    emit(state.copyWith(favourites: updatedFavourites, status: Status.success));
  }

  void _onUpdateSelectedStatus(UpdateSelectedStatus event, Emitter<FavouriteState> emit) {
    emit(state.copyWith(status: Status.loading));
    final index = state.favourites.indexWhere((element) => element.id == event.item.id);
    final updatedSelected = state.favourites[index].copyWith(isSelected: !state.favourites[index].isSelected);
    final updatedSeletedItems =List<FavouriteModel>.from(state.favourites)..[index] = updatedSelected;
    emit(state.copyWith(favourites: updatedSeletedItems, status: Status.success));
  }

}