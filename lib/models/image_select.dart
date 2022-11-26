import 'dart:io';
import 'package:images_picker/images_picker.dart';
import 'package:rice_geek/models/prediction.dart';

// class ImagePick {
//   final ImageSource imageSource;
//   dynamic theImage;
//   ImagePick({required this.imageSource}) {
//     pickImage(imageSource);
//   }
//   void pickImage(ImageSource src) async {
//     try {
//       final theImage = await ImagePickerPlus().pickImage(source: src);
//       if (theImage == null) return;
//       final imageTemp = File(theImage.path);
//     } on PlatformException catch (e) {
//       print('Failed to pick image: $e');
//     }
//   }
// }
Future<Map<String, dynamic>?> getImage(String src) async {
  List<Media>? res = (src == 'camera')
      ? await ImagesPicker.openCamera(
          // pickType: PickType.video,
          pickType: PickType.image,
          quality: 0.8,
          maxSize: 800,
          // cropOpt: CropOption(
          //   aspectRatio: CropAspectRatio.wh16x9,
          // ),
          maxTime: 15,
          cropOpt: CropOption(
            cropType: CropType.rect, // currently for android
          ),
        )
      : await ImagesPicker.pick(
          pickType: PickType.image,
        );

  if (res != null) {
    print(res[0].path + '-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
    final imageTemp = File(res[0].path);
    print('DONE-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
    final predictionTemp = await predictImage(imageTemp);
    // setState(() {
    //   theImage = imageTemp;
    //   prediction = predictionTemp;
    // });
    return {
      'theImage': imageTemp,
      'prediction': predictionTemp,
    };
    // print(prediction.toString());
  }
  return null;
}
// class ImagePick {
//   final String imageSource;
//   dynamic thePath;

//   ImagePick({required this.imageSource}) {
//     getImage(imageSource);
//   }

//   void getImage(String src) async {
//     List<Media>? res = await ImagesPicker.openCamera(
//       // pickType: PickType.video,
//       pickType: PickType.image,
//       quality: 0.8,
//       maxSize: 800,
//       // cropOpt: CropOption(
//       //   aspectRatio: CropAspectRatio.wh16x9,
//       // ),
//       maxTime: 15,
//     );

//     if (res != null) {
//       print(res[0].path + '-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
//       thePath = res[0].thumbPath;
//     }
//   }
// }
