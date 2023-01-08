import 'package:flutter/material.dart';
import 'package:sajaya_print_layout/commons/vertical_table.dart';
import 'package:sajaya_print_layout/misc/types.dart';

class TicketResume extends StatelessWidget {
  final Matrix data;
  const TicketResume({key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: VerticalTable(
      data: data,
      hasColon: true,
    ));
  }
}
