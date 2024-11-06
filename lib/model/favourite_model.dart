import 'package:equatable/equatable.dart';

class FavouriteModel extends Equatable{
  final String id ;
  final String name ;
  final bool isFavourite;
  final bool isSelected;

  const FavouriteModel({required this.id, required this.name, this.isFavourite = false, this.isSelected = false});

  FavouriteModel copyWith({String? id, String? name, bool? isFavourite, bool? isSelected}){
    return FavouriteModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isFavourite: isFavourite ?? this.isFavourite,
      isSelected: isSelected ?? this.isSelected
    );
  }

  @override
  List<Object?> get props => [id, name, isFavourite, isSelected];
}