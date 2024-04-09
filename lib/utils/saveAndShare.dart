import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';

import '../view/screens/editScreen.dart';

Future<ByteData?> imgSave() async {
  RenderRepaintBoundary boundary =
      finalImage.currentContext!.findRenderObject() as RenderRepaintBoundary;

  ui.Image image = await boundary.toImage();

  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  return byteData;
}
