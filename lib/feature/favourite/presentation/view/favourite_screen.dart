
import 'package:bloc_prectice/config/enums/status.dart';
import 'package:bloc_prectice/feature/favourite/presentation/bloc/favourite_bloc.dart';
import 'package:bloc_prectice/feature/favourite/presentation/bloc/favourite_event.dart';
import 'package:bloc_prectice/feature/favourite/presentation/bloc/favourite_state.dart';
import 'package:bloc_prectice/feature/favourite/data/models/favourite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    context.read<FavouriteBloc>().add(FetchFavouriteList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
      ),
      body:
          BlocBuilder<FavouriteBloc, FavouriteState>(builder: (context, state) {
        switch (state.status) {
          case Status.loading:
            return const Center(child: CircularProgressIndicator());
          case Status.success:
            if (state.favourites.isEmpty) {
              return const Center(
                  child: Text('No Favourites', style: TextStyle(fontSize: 20)));
            } else {
              return ListView.builder(
                itemCount: state.favourites.length,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  FavouriteModel favourite = state.favourites[index];
                  return Card(
                    child: ListTile(
                      leading: IconButton(
                          onPressed: () {
                             context
                              .read<FavouriteBloc>()
                              .add(UpdateSelectedStatus(favourite));
                          },
                          icon: Icon(favourite.isSelected
                              ? Icons.check_box_outlined
                              : Icons.check_box_outline_blank_rounded)),
                      title: Text(favourite.name,
                          style: TextStyle(
                              fontSize: 16,
                              decoration: favourite.isSelected
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none)),
                      trailing: IconButton(
                        icon: Icon(favourite.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border),
                        onPressed: () {
                          context
                              .read<FavouriteBloc>()
                              .add(UpdateFavouriteStatus(favourite));
                        },
                      ),
                    ),
                  );
                },
              );
            }
          default:
            return const Center(child: Text('Something went wrong!'));
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (context.read<FavouriteBloc>().state.favourites
              .any((element) => element.isSelected)) {
            context.read<FavouriteBloc>().add(DeleteFavourite());
          }
        },
        child: const Icon(Icons.delete),
      ),
    );
  }
}
