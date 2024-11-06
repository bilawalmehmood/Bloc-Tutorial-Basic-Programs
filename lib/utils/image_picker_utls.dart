import 'package:image_picker/image_picker.dart';

class ImagePickerUtls {
  
   Future<XFile?> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      return XFile(pickedFile.path);
    }
    return null;
  }
}