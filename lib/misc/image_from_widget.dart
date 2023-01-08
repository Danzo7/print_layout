import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

Future<Uint8List> imageFromWidget(Widget widget,
    {required double ratio,
    int? paperSize,
    TextDirection? textDirection}) async {
  final width = (paperSize ?? 58) * (192 / 58);
  ScreenshotController screenshotController = ScreenshotController();
  return await screenshotController.captureFromWidget(
      Directionality(
          textDirection: textDirection ?? TextDirection.ltr,
          child: Container(
              width: width,
              decoration: BoxDecoration(color: Colors.white),
              child: widget)),
      delay: const Duration(milliseconds: 100),
      pixelRatio: ratio);
}
