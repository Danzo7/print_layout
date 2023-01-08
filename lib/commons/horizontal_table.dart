import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sajaya_print_layout/misc/extensions.dart';
import 'package:sajaya_print_layout/misc/types.dart';

class HorizontalTable extends StatelessWidget {
  final bool? hasHeader;
  final List<int>? flex;
  final double minFontSize;
  final double maxFontSize;
  final double? fontSize;
  const HorizontalTable({
    Key? key,
    required this.data,
    this.hasHeader,
    this.flex,
    this.minFontSize = 8,
    this.maxFontSize = 9,
    this.fontSize,
  }) : super(key: key);

  final Matrix data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: data
          .map((e) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: e
                    .map((value) => Flexible(
                          flex: (flex != null &&
                                  flex!.asMap().containsKey(e.indexOf(value)))
                              ? flex![e.indexOf(value)]
                              : 1,
                          child: Container(
                            alignment:
                                Directionality.of(context) == TextDirection.rtl
                                    ? Alignment.bottomRight
                                    : Alignment.bottomLeft,
                            child: AutoSizeText(
                              value,
                              maxLines: 2,
                              maxFontSize: maxFontSize,
                              minFontSize: minFontSize,
                              style: TextStyle(
                                  color: Colors.black,
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: 'Cairo',
                                  fontSize: fontSize ?? maxFontSize,
                                  fontWeight: data.lastIndexOf(e) == 0
                                      ? FontWeight.w900
                                      : FontWeight.bold,
                                  height: 1),
                            ),
                          ),
                        ))
                    .toList(),
              ))
          .toList()
          .insertBetweenAll(SizedBox(
            height: 5,
          )),
    );
  }
}
