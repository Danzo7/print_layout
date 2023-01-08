import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sajaya_print_layout/commons/vertical_table.dart';
import 'package:sajaya_print_layout/misc/types.dart';

class TicketDetails extends StatelessWidget {
  final Matrix data; //TODO use the right Type or map to this type
  final String image;
  const TicketDetails({Key? key, required this.data, required this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border:
              Border.symmetric(horizontal: BorderSide(color: Colors.black))),
      child: Row(
        children: [
          Expanded(
              child: VerticalTable(
            data: data,
            hasColon: true,
          )),
          Container(
            width: 25,
            child:
                FittedBox(child: Image.memory(Base64Decoder().convert(image))),
            height: 25,
          ),
        ],
      ),
    );
  }
}
