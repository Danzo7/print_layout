import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../misc/types.dart';

class VerticalTable extends StatelessWidget {
  final bool? hasColon;
  final bool? hasBorderSecond;
  final Matrix data;
  final double minFontSize;
  final double maxFontSize;
  final double? fontSize;
  const VerticalTable(
      {key,
      required this.data,
      this.hasColon,
      this.hasBorderSecond,
      this.fontSize,
      this.minFontSize = 8,
      this.maxFontSize = 9})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: data
          .map((e) => [
                data.indexOf(e) == 0
                    ? Container(
                        child: Wrap(
                        direction: Axis.vertical,
                        children: e
                            .map((value) => Container(
                                  height: 12,
                                  alignment: Directionality.of(context) ==
                                          TextDirection.rtl
                                      ? Alignment.bottomRight
                                      : Alignment.bottomLeft,
                                  child: AutoSizeText(
                                    value,
                                    maxLines: 1,
                                    minFontSize: minFontSize,
                                    maxFontSize: maxFontSize,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Cairo',
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: fontSize ?? maxFontSize,
                                        fontWeight: FontWeight.bold,
                                        height: 1.2),
                                  ),
                                ))
                            .toList(),
                      ))
                    : Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: ((hasBorderSecond != null &&
                                      hasBorderSecond!))
                                  ? Border.all(color: Colors.black, width: 0.5)
                                  : null),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: e
                                .map((value) => Container(
                                      alignment: ((hasBorderSecond != null &&
                                              hasBorderSecond!))
                                          ? Directionality.of(context) ==
                                                  TextDirection.rtl
                                              ? Alignment.centerRight
                                              : Alignment.centerLeft
                                          : Directionality.of(context) ==
                                                  TextDirection.rtl
                                              ? Alignment.bottomRight
                                              : Alignment.bottomLeft,
                                      decoration: BoxDecoration(
                                          border: ((hasBorderSecond != null &&
                                                  hasBorderSecond!))
                                              ? Border.all(
                                                  color: Colors.black,
                                                  width: 0.5)
                                              : null),
                                      height: 12,
                                      child: AutoSizeText(
                                        value,
                                        maxLines: 1,
                                        minFontSize: minFontSize,
                                        maxFontSize: maxFontSize,
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.black,
                                            fontFamily: 'Cairo',
                                            fontSize: fontSize ?? maxFontSize,
                                            fontWeight: FontWeight.bold,
                                            height: 1.2),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                if (hasBorderSecond != null &&
                    hasBorderSecond! &&
                    data.indexOf(e) == 0)
                  SizedBox(width: 20),
                if (hasColon != null && hasColon! && data.indexOf(e) == 0)
                  Container(
                      child: Wrap(
                    direction: Axis.vertical,
                    children: e
                        .map((value) => Container(
                              height: 12,
                              alignment: Directionality.of(context) ==
                                      TextDirection.rtl
                                  ? Alignment.bottomRight
                                  : Alignment.bottomLeft,
                              child: AutoSizeText(
                                " : ",
                                maxLines: 1,
                                minFontSize: 8,
                                maxFontSize: 10,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Cairo',
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2),
                              ),
                            ))
                        .toList(),
                  ))
              ].toList())
          .expand((i) => i)
          .toList(),
    );
  }
}
