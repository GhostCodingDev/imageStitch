// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:typed_data';
import 'package:flutter_flow/flutter_flow_util.dart';
import 'package:opencv_dart/opencv_dart.dart' as cv;

Future<FFUploadedFile> stitchPanoramaWithDartFFI(
    List<FFUploadedFile> selectedImages) async {
  final List<cv.Mat> mats = [];
  for (final ffFile in selectedImages) {
    final Uint8List bytes = ffFile.bytes!;
    final cv.Mat mat = cv.imdecode(bytes, cv.IMREAD_COLOR);
    mats.add(mat);
  }
  final cv.Stitcher stitcher =
      cv.Stitcher.create(mode: cv.StitcherMode.PANORAMA);
  final (cv.StitcherStatus status, cv.Mat stitchedMat) =
      await stitcher.stitchAsync(mats.cvd);

  if (status != cv.StitcherStatus.OK) {
    throw Exception('OpenCV Stitcher failed with status $status');
  }

  final (bool encodeSuccess, Uint8List encodedBytes) =
      await cv.imencodeAsync(".png", stitchedMat);
  if (!encodeSuccess) {
    throw Exception('Failed to encode stitched image to PNG bytes');
  }

  final FFUploadedFile stitchedFile = FFUploadedFile(
    name: 'panorama_${DateTime.now().millisecondsSinceEpoch}.png',
    bytes: encodedBytes,
    url: '', // Not uploading anywhere—just local memory
  );

  return stitchedFile;
}
