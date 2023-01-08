import 'package:flutter/material.dart';
import 'package:sajaya_print_layout/commons/vertical_table.dart';
import 'package:sajaya_print_layout/misc/types.dart';

class TicketFinal extends StatelessWidget {
  final Matrix data;
  const TicketFinal({key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: VerticalTable(
      data: data,
      hasBorderSecond: true,
    ));
  }
}
