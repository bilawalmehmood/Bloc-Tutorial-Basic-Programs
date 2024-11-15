import 'package:bloc_prectice/config/enums/status.dart';
import 'package:bloc_prectice/feature/favourite/data/models/favourite_model.dart';
import 'package:equatable/equatable.dart';

class FavouriteState extends Equatable {
  final Status status;
  final List<FavouriteModel> favourites;

  const FavouriteState(
      {this.favourites = const [], this.status = Status.loading});

  FavouriteState copyWith({List<FavouriteModel>? favourites, Status? status}) {
    return FavouriteState(
        favourites: favourites ?? this.favourites,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [favourites, status];
}
