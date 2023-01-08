import 'package:flutter/material.dart';
import 'package:sajaya_print_layout/misc/extensions.dart';
import 'package:sajaya_print_layout/misc/image.dart';
import 'package:sajaya_print_layout/misc/image_from_widget.dart';
import 'package:sajaya_print_layout/misc/types.dart';
import 'package:sajaya_print_layout/print_template.dart';
import 'package:sajaya_print_layout/widgets/ticket_details.dart';
import 'package:sajaya_print_layout/widgets/ticket_final.dart';
import 'package:sajaya_print_layout/widgets/ticket_product_table.dart';
import 'package:sajaya_print_layout/widgets/ticket_resume.dart';
import 'package:sunmi_printer_plus/enums.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';

class PrinterExampleScreen extends StatefulWidget {
  const PrinterExampleScreen({Key? key}) : super(key: key);

  @override
  State<PrinterExampleScreen> createState() => _PrinterExampleScreenState();
}

class _PrinterExampleScreenState extends State<PrinterExampleScreen> {
  late bool isArabic = true;

  @override
  Widget build(BuildContext context) {
    Matrix ticketDetails = [
      isArabic
          ? ["المحمول", "رقم الحركة", "التاريخ والوقت", "المندوب"]
          : ["Phone", "Move n°", "Date and time", "Seller"],
      ["", "212121", "23/12/2003 10:05 AM ", "manager"]
    ];
    Matrix ticketProducts = [
      isArabic
          ? ["المنتج", "الكمية", "السعر", "الاجمالي"]
          : ["Product", "Quantity", "Price", "Total"],
      [
        isArabic
            ? "منتج طويل جدا لاختبار تفصيل الخط"
            : "Product with a very long name to test the line wrap function",
        "120",
        "20",
        "20000"
      ],
      ["Potato", "120", "20", "20000"],
      ["Tomato", "120", "20", "20000"],
      ["Rice", "120", "20", "20000"],
      ...() {
        int n = 2;
        Matrix x = [];
        for (int i = 0; i < n; i++) {
          x.add(["تجربة", i.toString(), "20", "20000"]);
        }
        return x;
      }()
    ];
    Matrix resumeData = [
      isArabic
          ? ["عدد الاصناف والمجموع", "المجموع قبل الخصم", "قيمة الخصم"]
          : [
              "Types amount and total",
              "Total before discount",
              "Discount amount"
            ],
      ["100", "14", "12"],
      ["15"]
    ];
    Matrix finalData = [
      isArabic
          ? ["الاجمالي بعد الضريبة", "قيمة الضريبة", "الاجمالي بعد الخصم"]
          : ["Total after discount", "Tax", "Total with tax"],
      ["100", "14", "12"]
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('تجربة الطباعة'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      printTemplate(context,
                          image: base64ImageTest,
                          ticketDetails: ticketDetails,
                          ticketProducts: ticketProducts,
                          ticketFinal: finalData,
                          ticketResume: resumeData,
                          textDirection:
                              isArabic ? TextDirection.rtl : TextDirection.ltr);
                    },
                    child: const Text('اطبع')),
                RadioListTile(
                    groupValue: isArabic ? "العربية" : "English",
                    value: "العربية",
                    title: const Text("العربية"),
                    onChanged: (value) {
                      setState(() {
                        isArabic = true;
                      });
                    }),
                RadioListTile(
                    groupValue: isArabic ? "العربية" : "English",
                    value: "English",
                    title: const Text("English"),
                    onChanged: (value) {
                      setState(() {
                        isArabic = false;
                      });
                    }),
              ]),
        ));
  }
}
