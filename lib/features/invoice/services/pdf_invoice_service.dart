import 'dart:io';

import 'package:facturo/constants/utils.dart';
import 'package:facturo/features/invoice/services/pdf_service.dart';
import 'package:facturo/models/client.dart';
import 'package:facturo/models/invoice.dart';
import 'package:facturo/models/invoice_with_items.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfInvoiceService {
  static Future<File> generate(InvoiceWithItems invoiceWithItems) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        buildHeader(invoiceWithItems),
        SizedBox(height: 3 * PdfPageFormat.cm),
        buildTitle(invoiceWithItems),
        buildInvoice(invoiceWithItems),
        Divider(),
        buildTotal(invoiceWithItems),
      ],
      footer: (context) => buildFooter(invoiceWithItems),
    ));

    return PdfService.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
  }

  static Widget buildHeader(InvoiceWithItems invoiceWithItems) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildSupplierAddress(invoiceWithItems),
              // Container(
              //   height: 50,
              //   width: 50,
              //   child: BarcodeWidget(
              //     barcode: Barcode.qrCode(),
              //     data: invoice.info.number,
              //   ),
              // ),
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCustomerAddress(invoiceWithItems.invoice.client),
              buildInvoiceInfo(invoiceWithItems.invoice),
            ],
          ),
        ],
      );

  static Widget buildCustomerAddress(Client client) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(client.name, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(client.address),
        ],
      );

  static Widget buildInvoiceInfo(Invoice invoice) {
    // final paymentTerms = '${info.dueDate.difference(info.date).inDays} days';
    final titles = <String>[
      'Invoice Number:',
      'Invoice Date:',
      // 'Payment Terms:',
      'Due Date:'
    ];
    final data = <String>[
      "INV",
      Utils.formatDate(DateTime.parse(invoice.currentDate)),
      Utils.formatDate(DateTime.parse(invoice.dueDate)),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(titles.length, (index) {
        final title = titles[index];
        final value = data[index];

        return buildText(title: title, value: value, width: 200);
      }),
    );
  }

  static Widget buildSupplierAddress(InvoiceWithItems invoiceWithItems) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(invoiceWithItems.invoice.client.businessName, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(invoiceWithItems.invoice.client.address),
        ],
      );

  static Widget buildTitle(InvoiceWithItems invoiceWithItems) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'INVOICE',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          // Text(invoice.info.description),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );

  static Widget buildInvoice(InvoiceWithItems invoiceWithItems) {
    final headers = [
      'Designation',
      'Quantité',
      'Prix unitaire',
      'Total'
    ];
    final data = invoiceWithItems.itemsInvoice.map((item) {
      final total = item.price * item.quantity ;

      return [
        item.name,
        '${item.quantity}',
        ' ${item.price} FCFA',
        '\$ ${total.toStringAsFixed(2)}',
      ];
    }).toList();

    return pw.TableHelper.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: const BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
        5: Alignment.centerRight,
      },
    );
  }

  static Widget buildTotal(InvoiceWithItems invoiceWithItems) {
      double total = 0.0;
      invoiceWithItems.itemsInvoice.forEach((element) {
        total += element.quantity * element.price;
      });
    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(flex: 6),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // buildText(
                //   title: 'Net total',
                //   value: Utils.formatPrice(netTotal),
                //   unite: true,
                // ),
                // buildText(
                //   title: 'Vat ${vatPercent * 100} %',
                //   value: Utils.formatPrice(vat),
                //   unite: true,
                // ),
                // Divider(),
                buildText(
                  title: 'Total amount due',
                  titleStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  value: Utils.formatPrice(total),
                  unite: true,
                ),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildFooter(InvoiceWithItems invoiceWithItems) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          SizedBox(height: 2 * PdfPageFormat.mm),
          buildSimpleText(title: 'Adresse', value: invoiceWithItems.invoice.client.address),
          // SizedBox(height: 1 * PdfPageFormat.mm),
          // buildSimpleText(title: 'Paypal', value: invoice.supplier.paymentInfo),
        ],
      );

  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }
}