import 'package:flutter/material.dart';
import 'package:sajaya_print_layout/commons/horizontal_table.dart';
import 'package:sajaya_print_layout/misc/types.dart';

class TicketProductTable extends StatelessWidget {
  final Matrix data;
  final bool? hasHeader;

  final bool? expandFirst;
  const TicketProductTable(
      {Key? key, required this.data, this.expandFirst, this.hasHeader})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: HorizontalTable(
      data: data,
      hasHeader: hasHeader,
      flex: [expandFirst != null && expandFirst! ? 2 : 1],
    ));
  }
}
