import 'dart:io';

import 'package:facturo/constants/utils.dart';
import 'package:facturo/features/invoice/services/pdf_service.dart';
import 'package:facturo/models/client.dart';
import 'package:facturo/models/invoice_with_items.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfInvoiceService {
  static Future<File> generate(InvoiceWithItems invoiceWithItems) async {
    final pdf = Document();

    // Charger l'image depuis les assets
    final imageLogo = await rootBundle.load('assets/images/logo.png');
    final logo = pw.MemoryImage(imageLogo.buffer.asUint8List());


    pdf.addPage(MultiPage(
      build: (context) => [
        buildHeader(invoiceWithItems, logo),
        SizedBox(height: 1 * PdfPageFormat.cm),
        buildInvoice(invoiceWithItems),
        Divider(),
        buildTotal(invoiceWithItems),
      ],
      footer: (context) => buildFooter(invoiceWithItems,logo),
    ));

    return PdfService.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
  }

  static Widget buildHeader(InvoiceWithItems invoiceWithItems, ImageProvider logo) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Facture',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              pw.Image(logo, width: 150, height: 150),
           
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                child: Text(
                  'Vendeur',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 1 * PdfPageFormat.cm),
              buildSupplierAddress(invoiceWithItems),
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),

          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                child: Text(
                  'Client',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 1 * PdfPageFormat.cm),
              buildClientAddress(invoiceWithItems.invoice.client),
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date de facturation",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 1 * PdfPageFormat.mm),
                  Text(Utils.formatDate(
                      DateTime.parse(invoiceWithItems.invoice.currentDate))),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Numero", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 1 * PdfPageFormat.mm),
                  Text("INV"),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Echéance",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 1 * PdfPageFormat.mm),
                  Text(Utils.formatDate(
                      DateTime.parse(invoiceWithItems.invoice.dueDate))),
                ],
              ),
            ],
          ),
        ],
      );

  static Widget buildClientAddress(Client client) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(client.name, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(client.address),
        ],
      );



  static Widget buildSupplierAddress(InvoiceWithItems invoiceWithItems) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("CWorth Energy", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text("N'Djamena"),
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
    final headers = ['Designation', 'Quantité', 'Prix unitaire', 'Total'];
    final data = invoiceWithItems.itemsInvoice.map((item) {
      final total = item.price * item.quantity;

      return [
        item.name,
        '${item.quantity}',
        ' ${item.price} FCFA',
        '${total.toStringAsFixed(2)} FCFA',
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
                  title: 'Total',
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

  static Widget buildFooter(InvoiceWithItems invoiceWithItems, ImageProvider logo) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          SizedBox(height: 2 * PdfPageFormat.mm),
          Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
          
          pw.Image(logo, width: 150, height: 150),

          buildSimpleText(
              title: 'Adresse', value: invoiceWithItems.invoice.client.address),
          ])
              
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
