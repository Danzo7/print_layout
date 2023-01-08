import 'package:flutter/material.dart';
import 'package:sajaya_print_layout/misc/extensions.dart';
import 'package:sajaya_print_layout/misc/image_from_widget.dart';
import 'package:sajaya_print_layout/misc/types.dart';
import 'package:sajaya_print_layout/widgets/ticket_details.dart';
import 'package:sajaya_print_layout/widgets/ticket_final.dart';
import 'package:sajaya_print_layout/widgets/ticket_product_table.dart';
import 'package:sajaya_print_layout/widgets/ticket_resume.dart';
import 'package:sunmi_printer_plus/enums.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';

//TODO define print function with the right parameters

printTemplate(
  BuildContext context, {
  required Matrix ticketDetails,
  required Matrix ticketProducts,
  required Matrix ticketResume,
  required Matrix ticketFinal,
  required String image,
  TextDirection textDirection = TextDirection.rtl,
}) async {
  double pixelRatio = MediaQuery.of(context).devicePixelRatio;

  await SunmiPrinter.initPrinter();
  await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
  await SunmiPrinter.startTransactionPrint(true);

  await SunmiPrinter.printImage(await imageFromWidget(
      Text("العلامة التجارية العلامة التجارية",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              overflow: TextOverflow.ellipsis,
              fontFamily: 'Cairo',
              fontSize: 10,
              fontWeight: FontWeight.w900,
              height: 1)),
      ratio: pixelRatio,
      textDirection: textDirection));
  await SunmiPrinter.lineWrap(1);
  await SunmiPrinter.printImage(await imageFromWidget(
      Text("العلامة التجارية العلامة التجارية",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              overflow: TextOverflow.ellipsis,
              fontFamily: 'Cairo',
              fontSize: 10,
              fontWeight: FontWeight.w900,
              height: 1)),
      ratio: pixelRatio,
      textDirection: textDirection));
  await SunmiPrinter.lineWrap(2);

  await SunmiPrinter.printImage(await imageFromWidget(
      TicketDetails(
        data: ticketDetails,
        image: image,
      ),
      ratio: pixelRatio,
      textDirection: textDirection));
  await SunmiPrinter.lineWrap(2);

  var chunks = ticketProducts.toChunks(15);
  for (var element in chunks) {
    await SunmiPrinter.printImage(await imageFromWidget(
        TicketProductTable(
            hasHeader: chunks.indexOf(element) == 0, data: element),
        ratio: pixelRatio,
        textDirection: textDirection));
  }

  await SunmiPrinter.lineWrap(2);
  await SunmiPrinter.printImage(await imageFromWidget(
      TicketResume(data: ticketResume),
      ratio: pixelRatio,
      textDirection: textDirection));
  await SunmiPrinter.lineWrap(2);
  await SunmiPrinter.printImage(
    await imageFromWidget(TicketFinal(data: ticketFinal),
        ratio: pixelRatio, textDirection: textDirection),
  );
  await SunmiPrinter.lineWrap(4);

  await SunmiPrinter.exitTransactionPrint(true);
}
