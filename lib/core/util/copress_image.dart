import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

Future<File?> compressImageToMaxSize(File file,
    {int maxSizeInBytes = 4 * 1024 * 1024}) async {
  Directory dir = await getTemporaryDirectory();

  int quality = 95;
  File? compressedFile;
  String targetPath =
      p.join(dir.absolute.path, "${DateTime.now().millisecondsSinceEpoch}.jpg");

  while (quality > 10) {
    XFile? result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: quality,
      minWidth: 1024,
      minHeight: 1024,
      autoCorrectionAngle: true,
    );
    if (result == null) break;
    int compressedSize = await result.length();
    if (compressedSize <= maxSizeInBytes) {
      compressedFile = File(result.path);
      break;
    }

    quality -= 10;
  }

  return compressedFile;
}
