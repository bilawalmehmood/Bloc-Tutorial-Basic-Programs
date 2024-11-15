import 'package:bloc_prectice/feature/favourite/data/models/favourite_model.dart';

class FavouriteRepository{

  Future<List<FavouriteModel>> fetchFavourite() async {
    await Future.delayed(const Duration(seconds: 2));
    return List.generate(10, (index) => FavouriteModel(id: index.toString(), name: 'Favourite $index'));
  }
  
}