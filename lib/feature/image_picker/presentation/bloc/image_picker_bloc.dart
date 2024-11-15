import 'package:bloc_prectice/feature/image_picker/presentation/bloc/image_picker_event.dart';
import 'package:bloc_prectice/feature/image_picker/presentation/bloc/image_picker_state.dart';
import 'package:bloc_prectice/config/utils/image_picker_utls.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtls imagePickerUtls;
  ImagePickerBloc(this.imagePickerUtls) : super(const ImagePickerState()) {
    on<PickFromCamera>(_onPickFromCamera);
    on<PickFromGallery>(_onPickFromGallery);
  }

  void _onPickFromCamera(
      PickFromCamera event, Emitter<ImagePickerState> emit) async {
    final image = await imagePickerUtls.pickImage(ImageSource.camera);
    emit(state.copyWith(image: image));
  }

  void _onPickFromGallery(
      PickFromGallery event, Emitter<ImagePickerState> emit) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    emit(state.copyWith(image: image));
  }
}
