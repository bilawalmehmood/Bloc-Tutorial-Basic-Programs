import 'dart:io';

import 'package:bloc_prectice/feature/image_picker/presentation/bloc/image_picker_bloc.dart';
import 'package:bloc_prectice/feature/image_picker/presentation/bloc/image_picker_event.dart';
import 'package:bloc_prectice/feature/image_picker/presentation/bloc/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have picked the image:',
            ),
            const SizedBox(height: 20),
            BlocBuilder<ImagePickerBloc, ImagePickerState>(
                builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  context.read<ImagePickerBloc>().add(PickFromCamera());
                },
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: state.image == null
                        ? null
                        : DecorationImage(
                            image: FileImage(File(state.image!.path)),
                            fit: BoxFit.cover),
                  ),
                  child:state.image != null ? const SizedBox(): const Center(
                    child: Icon(Icons.image, size: 100, color: Colors.white),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
