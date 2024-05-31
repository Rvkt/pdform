import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:printing/printing.dart';
import 'dart:developer';

class SlipScreen extends StatefulWidget {
  const SlipScreen({Key? key}) : super(key: key);

  @override
  State<SlipScreen> createState() => _SlipScreenState();
}

class _SlipScreenState extends State<SlipScreen> {
  final pdf = pw.Document();
  String? filePath;

  // Create a list of column names
  List<String> columnNames = [
    'Description',
    'HSN Code',
    'Gram',
    'Rate/gm (INR)',
    'Amount (INR)',
  ];

// Create a list of data rows (for demonstration purposes)
  List<List<String>> rows = [
    ['Gold 24K 99.9%', '7106', '0.0181', '3.00 (INR/gm)', '97.09'],
    ['Net Total', '', '', '', '35.00'],
    ['CGST', '', '', '', '1.75'],
    ['SGST', '', '', '', '1.75'],
    ['IGST', '', '', '', '3.50'],
    ['Total', '', '', '', '100.000'],
    // ['Item 2', '654321', '20', '150', '3000'],
    // Add more rows as needed
  ];

  pw.TableRow buildTableRow(List<String> row) {
    return pw.TableRow(
      children: row.map((item) => pw.Text(item)).toList(),
    );
  }

  void _addPdfPage() {
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Center(
                child: pw.Text(
                  "Tax Invoice",
                  style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
                ),
              ),
              pw.SizedBox(height: 12),
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(vertical: 8),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Sold by:',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                        color: const PdfColor.fromInt(0xFF44B50C),
                      ),
                    ),
                    pw.Row(
                      children: [
                        pw.Text(
                          'Augmont Goldtech Private Limited',
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                            // color: const PdfColor.fromInt(0xFF0000FF),
                          ),
                        ),
                        pw.SizedBox(width: 4),
                        pw.Text(
                          '(Formerly known as Augmont Precious Metal Private Limited)',
                          style: const pw.TextStyle(
                            fontSize: 8,
                            // fontWeight: pw.FontWeight.bold,
                            // color: const PdfColor.fromInt(0xFF0000FF),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // pw.SizedBox(height: 8),
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(vertical: 8),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Address',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                        // color: const PdfColor.fromInt(0xFF44B50C),
                      ),
                    ),
                    pw.SizedBox(height: 4),
                    pw.Text(
                      '504, 5th floor, Trade Link, E-Wing, Kamla Mills Compound, Lower Parel,',
                      style: const pw.TextStyle(
                        fontSize: 12,
                        // fontWeight: pw.FontWeight.bold,
                        // color: const PdfColor.fromInt(0xFF0000FF),
                      ),
                    ),
                    pw.Text(
                      'Mumbai, Maharashtra - 400013',
                      style: const pw.TextStyle(
                        fontSize: 12,
                        // fontWeight: pw.FontWeight.bold,
                        // color: const PdfColor.fromInt(0xFF0000FF),
                      ),
                    ),
                  ],
                ),
              ),

              // pw.SizedBox(height: 8),
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(vertical: 8),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Customer Address:',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                        color: const PdfColor.fromInt(0xFF44B50C),
                      ),
                    ),
                    pw.SizedBox(height: 4),
                    pw.Text(
                      'Ritesh Bhagat',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                        // color: const PdfColor.fromInt(0xFF0000FF),
                      ),
                    ),
                    pw.Text(
                      '401101 - Maharashtra, India',
                      style: const pw.TextStyle(
                        fontSize: 12,
                        // fontWeight: pw.FontWeight.bold,
                        // color: const PdfColor.fromInt(0xFF0000FF),
                      ),
                    ),
                    pw.Text(
                      '9773393443',
                      style: const pw.TextStyle(
                        fontSize: 12,
                        // fontWeight: pw.FontWeight.bold,
                        // color: const PdfColor.fromInt(0xFF0000FF),
                      ),
                    ),
                    pw.Text(
                      'bhagatritesh1988@gmail.com',
                      style: const pw.TextStyle(
                        fontSize: 12,
                        // fontWeight: pw.FontWeight.bold,
                        // color: const PdfColor.fromInt(0xFF0000FF),
                      ),
                    ),
                    // pw.SizedBox(height: 8),
                  ],
                ),
              ),

              pw.Container(
                padding: const pw.EdgeInsets.symmetric(vertical: 8),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Augmont Unique ID:',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                        color: const PdfColor.fromInt(0xFF44B50C),
                      ),
                    ),
                    pw.SizedBox(height: 4),
                    pw.Text(
                      'WF167715986940074150000124',
                      style: pw.TextStyle(
                        fontSize: 12,
                        // fontWeight: pw.FontWeight.bold,
                        // color: const PdfColor.fromInt(0xFF0000FF),
                      ),
                    ),
                    // pw.SizedBox(height: 8),
                  ],
                ),
              ),

              pw.Container(
                padding: const pw.EdgeInsets.symmetric(vertical: 8),
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Payment Mode Used:',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                        color: const PdfColor.fromInt(0xFF44B50C),
                      ),
                    ),
                    pw.SizedBox(width: 4),
                    pw.Text(
                      'UPI',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                        // color: const PdfColor.fromInt(0xFF0000FF),
                      ),
                    ),
                    // pw.SizedBox(height: 8),
                  ],
                ),
              ),

              pw.SizedBox(height: 8),
              pw.Container(
                // padding: const pw.EdgeInsets.symmetric(vertical: 2),
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Expanded(
                      child: pw.Row(
                        children: [
                          pw.Text(
                            'Date:',
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                              color: const PdfColor.fromInt(0xFF44B50C),
                            ),
                          ),
                          pw.SizedBox(width: 4),
                          pw.Text(
                            'May 22, 2024',
                            style: pw.TextStyle(
                              fontSize: 12,
                              // fontWeight: pw.FontWeight.bold,
                              // color: const PdfColor.fromInt(0xFF0000FF),
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.Expanded(
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.end,
                        children: [
                          pw.Text(
                            'Invoice:',
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                              color: const PdfColor.fromInt(0xFF44B50C),
                            ),
                          ),
                          pw.SizedBox(width: 4),
                          pw.Text(
                            'INV-12345',
                            style: pw.TextStyle(
                              fontSize: 12,
                              // fontWeight: pw.FontWeight.bold,
                              // color: const PdfColor.fromInt(0xFF0000FF),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              pw.Container(
                padding: const pw.EdgeInsets.symmetric(vertical: 8),
                child: pw.Table(
                  border: const pw.TableBorder(
                    top: pw.BorderSide(width: 1),
                    bottom: pw.BorderSide(width: 1),
                    // left: false,
                    // right: false,
                    // horizontalInside: false,
                    // verticalInside: false,
                    // color: PdfColors.grey.shade(10),
                    // width: 1,
                  ),
                  columnWidths: {
                    0: const pw.FractionColumnWidth(0.25),
                    1: const pw.FractionColumnWidth(0.2),
                    2: const pw.FractionColumnWidth(0.15),
                    3: const pw.FractionColumnWidth(0.2),
                    4: const pw.FractionColumnWidth(0.2),
                  },
                  children: [
                    // Header row
                    pw.TableRow(
                      decoration: const pw.BoxDecoration(
                        border: pw.TableBorder(
                          top: pw.BorderSide(width: 0.5),
                          bottom: pw.BorderSide(width: 0.5),
                          // left: false,
                          // right: false,
                          // horizontalInside: false,
                          // verticalInside: false,
                          // color: PdfColors.grey.shade(10),
                          // width: 1,
                        ),
                      ),
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                          child: pw.Text('Description', textAlign: pw.TextAlign.start, style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: const PdfColor.fromInt(0xFF44B50C))),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                          child: pw.Text('HSN Code', textAlign: pw.TextAlign.end, style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: const PdfColor.fromInt(0xFF44B50C))),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                          child: pw.Text('Gram', textAlign: pw.TextAlign.end, style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: const PdfColor.fromInt(0xFF44B50C))),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                          child: pw.Text('Rate/gm (INR)', textAlign: pw.TextAlign.end, style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: const PdfColor.fromInt(0xFF44B50C))),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                          child: pw.Text('Amount (INR)', textAlign: pw.TextAlign.end, style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: const PdfColor.fromInt(0xFF44B50C))),
                        ),
                      ],
                    ),
                    pw.TableRow(
                      // decoration: const pw.BoxDecoration(
                      // border: pw.TableBorder(
                      // top: pw.BorderSide(width: 0.5),
                      // bottom: pw.BorderSide(width: 0.5),
                      // left: false,
                      // right: false,
                      // horizontalInside: false,
                      // verticalInside: false,
                      // color: PdfColors.grey.shade(10),
                      // width: 1,
                      // )
                      // ),
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                          child: pw.Text(
                            'Gold 24K 99.99%',
                            style: const pw.TextStyle(
                              fontSize: 12,
                              // fontWeight: pw.FontWeight.bold,
                              // color: const PdfColor.fromInt(0xFF44B50C),
                            ),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                          child: pw.Text(
                            '7106',
                            textAlign: pw.TextAlign.end,
                            style: const pw.TextStyle(
                              fontSize: 12,
                              // fontWeight: pw.FontWeight.bold,
                              // color: const PdfColor.fromInt(0xFF44B50C),
                            ),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                          child: pw.Text(
                            '0.0181',
                            textAlign: pw.TextAlign.end,
                            style: const pw.TextStyle(
                              fontSize: 12,
                              // fontWeight: pw.FontWeight.bold,
                              // color: const PdfColor.fromInt(0xFF44B50C),
                            ),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                          child: pw.Text(
                            '3.00 (INR/gm)',
                            textAlign: pw.TextAlign.end,
                            style: const pw.TextStyle(
                              fontSize: 12,
                              // fontWeight: pw.FontWeight.bold,
                              // color: const PdfColor.fromInt(0xFF44B50C),
                            ),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                          child: pw.Text(
                            '97.09',
                            textAlign: pw.TextAlign.end,
                            style: const pw.TextStyle(
                              fontSize: 12,
                              // fontWeight: pw.FontWeight.bold,
                              // color: const PdfColor.fromInt(0xFF44B50C),
                            ),
                          ),
                        ),
                      ],
                    ),

                    pw.TableRow(
                      // decoration: const pw.BoxDecoration(
                      //   border: pw.TableBorder(
                      //     // top: pw.BorderSide(width: 0.5),
                      //     // bottom: pw.BorderSide(width: 0.5),
                      //     // left: false,
                      //     // right: false,
                      //     // horizontalInside: false,
                      //     // verticalInside: false,
                      //     // color: PdfColors.grey.shade(10),
                      //     // width: 1,
                      //   ),
                      // ),
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                          child: pw.Text(
                            'Net Total',
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                              // color: const PdfColor.fromInt(0xFF44B50C),
                            ),
                          ),
                        ),
                        pw.SizedBox(),
                        pw.SizedBox(),
                        pw.SizedBox(),
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                          child: pw.Text(
                            '35.00',
                            textAlign: pw.TextAlign.end,
                            style: const pw.TextStyle(
                              fontSize: 12,
                              // fontWeight: pw.FontWeight.bold,
                              // color: const PdfColor.fromInt(0xFF44B50C),
                            ),
                          ),
                        ),
                      ],
                    ),

                    pw.TableRow(
                      // decoration: const pw.BoxDecoration(
                      //   border: pw.TableBorder(
                      //     // top: pw.BorderSide(width: 0.5),
                      //     // bottom: pw.BorderSide(width: 0.5),
                      //     // left: false,
                      //     // right: false,
                      //     // horizontalInside: false,
                      //     // verticalInside: false,
                      //     // color: PdfColors.grey.shade(10),
                      //     // width: 1,
                      //   ),
                      // ),
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                          child: pw.Text(
                            'CGST',
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                              // color: const PdfColor.fromInt(0xFF44B50C),
                            ),
                          ),
                        ),
                        pw.SizedBox(),
                        pw.SizedBox(),
                        pw.SizedBox(),
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                          child: pw.Text(
                            '1.75',
                            textAlign: pw.TextAlign.end,
                            style: const pw.TextStyle(
                              fontSize: 12,
                              // fontWeight: pw.FontWeight.bold,
                              // color: const PdfColor.fromInt(0xFF44B50C),
                            ),
                          ),
                        ),
                      ],
                    ),

                    pw.TableRow(
                      // decoration: const pw.BoxDecoration(
                      //   border: pw.TableBorder(
                      //     // top: pw.BorderSide(width: 0.5),
                      //     bottom: pw.BorderSide(width: 0.5),
                      //     // left: false,
                      //     // right: false,
                      //     // horizontalInside: false,
                      //     // verticalInside: false,
                      //     // color: PdfColors.grey.shade(10),
                      //     // width: 1,
                      //   ),
                      // ),
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                          child: pw.Text(
                            'SGST',
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                              // color: const PdfColor.fromInt(0xFF44B50C),
                            ),
                          ),
                        ),
                        pw.SizedBox(),
                        pw.SizedBox(),
                        pw.SizedBox(),
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                          child: pw.Text(
                            '1.75',
                            textAlign: pw.TextAlign.end,
                            style: const pw.TextStyle(
                              fontSize: 12,
                              // fontWeight: pw.FontWeight.bold,
                              // color: const PdfColor.fromInt(0xFF44B50C),
                            ),
                          ),
                        ),
                      ],
                    ),

                    pw.TableRow(
                      // decoration: const pw.BoxDecoration(
                      //   border: pw.TableBorder(
                      //     // top: pw.BorderSide(width: 0.5),
                      //     // bottom: pw.BorderSide(width: 0.5),
                      //     // left: false,
                      //     // right: false,
                      //     // horizontalInside: false,
                      //     // verticalInside: false,
                      //     // color: PdfColors.grey.shade(10),
                      //     // width: 1,
                      //   ),
                      // ),
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                          child: pw.Text(
                            'IGST',
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                              // color: const PdfColor.fromInt(0xFF44B50C),
                            ),
                          ),
                        ),
                        pw.SizedBox(),
                        pw.SizedBox(),
                        pw.SizedBox(),
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                          child: pw.Text(
                            '3.50',
                            textAlign: pw.TextAlign.end,
                            style: const pw.TextStyle(
                              fontSize: 12,
                              // fontWeight: pw.FontWeight.bold,
                              // color: const PdfColor.fromInt(0xFF44B50C),
                            ),
                          ),
                        ),
                      ],
                    ),

                    pw.TableRow(
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                          child: pw.Text(
                            'Total',
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                              // color: const PdfColor.fromInt(0xFF44B50C),
                            ),
                          ),
                        ),
                        // Empty SizedBox for second column
                        pw.SizedBox(),
                        // Empty SizedBox for third column
                        pw.SizedBox(),
                        // Empty SizedBox for fourth column
                        pw.SizedBox(),
                        pw.Padding(
                          padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                          child: pw.Text(
                            '100.00',
                            textAlign: pw.TextAlign.end,
                            style: const pw.TextStyle(
                              fontSize: 12,
                              // fontWeight: pw.FontWeight.bold,
                              // color: const PdfColor.fromInt(0xFF44B50C),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // pw.SizedBox(height: 8),

              //   Terms and conditions
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(vertical: 8),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Terms & Conditions:',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                        color: const PdfColor.fromInt(0xFF44B50C),
                      ),
                    ),
                    pw.SizedBox(height: 4),
                    pw.Bullet(
                      text: 'Goods once sold will not be returned.',
                      style: pw.TextStyle(
                        fontSize: 12,
                        // fontWeight: pw.FontWeight.bold,
                        // color: const PdfColor.fromInt(0xFF0000FF),
                      ),
                    ),
                    pw.Bullet(
                      text: 'Any disputes shall be subject to Mumbai jurisdiction.',
                      style: const pw.TextStyle(
                        fontSize: 12,
                        // fontWeight: pw.FontWeight.bold,
                        // color: const PdfColor.fromInt(0xFF0000FF),
                      ),
                    ),
                    pw.Bullet(
                      text: 'Additional payment gateway surcharge might be leveled by the partner.',
                      style: const pw.TextStyle(
                        fontSize: 12,
                        // fontWeight: pw.FontWeight.bold,
                        // color: const PdfColor.fromInt(0xFF0000FF),
                      ),
                    ),
                    // pw.Text(
                    //   'Ritesh Bhagat',
                    //   style: pw.TextStyle(
                    //     fontSize: 12,
                    //     fontWeight: pw.FontWeight.bold,
                    //     // color: const PdfColor.fromInt(0xFF0000FF),
                    //   ),
                    // ),
                    // pw.Text(
                    //   '401101 - Maharashtra, India',
                    //   style: const pw.TextStyle(
                    //     fontSize: 12,
                    //     // fontWeight: pw.FontWeight.bold,
                    //     // color: const PdfColor.fromInt(0xFF0000FF),
                    //   ),
                    // ),
                    // pw.Text(
                    //   '9773393443',
                    //   style: const pw.TextStyle(
                    //     fontSize: 12,
                    //     // fontWeight: pw.FontWeight.bold,
                    //     // color: const PdfColor.fromInt(0xFF0000FF),
                    //   ),
                    // ),
                    // pw.Text(
                    //   'bhagatritesh1988@gmail.com',
                    //   style: const pw.TextStyle(
                    //     fontSize: 12,
                    //     // fontWeight: pw.FontWeight.bold,
                    //     // color: const PdfColor.fromInt(0xFF0000FF),
                    //   ),
                    // ),
                    pw.SizedBox(height: 8),
                  ],
                ),
              ),

              //   authorised signatory
              pw.SizedBox(height: 8),
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(vertical: 8),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Authorised Signatory',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                        // color: const PdfColor.fromInt(0xFF44B50C),
                      ),
                    ),
                    pw.SizedBox(height: 4), // Optional: Add space between the text and row
                    pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'GSTIN: ',
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                            color: const PdfColor.fromInt(0xFF44B50C),
                          ),
                        ),
                        pw.Text(
                          '27AATCA3030A1Z3',
                          style: pw.TextStyle(
                            fontSize: 12,
                            // fontWeight: pw.FontWeight.bold,
                            // color: const PdfColor.fromInt(0xFF44B50C),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // pw.Spacer(),

              pw.Divider(),
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(vertical: 0),
                child: pw.Column(
                  children: [
                    pw.Text(
                      'This is a computer generated invoice, if you have any question concerning this invoice, contact',
                      textAlign: pw.TextAlign.center,
                      style: const pw.TextStyle(
                        fontSize: 12,
                        // fontWeight: pw.FontWeight.bold,
                        // color: const PdfColor.fromInt(0xFF44B50C),
                      ),
                    ),
                    pw.Text(
                      'support@wishfin.gold',
                      textAlign: pw.TextAlign.center,
                      style: const pw.TextStyle(
                        fontSize: 12,
                        // fontWeight: pw.FontWeight.bold,
                        color: PdfColor.fromInt(0xFF44B50C),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
          return pw.Center(
            child: pw.Text("Hello, PDF!", style: const pw.TextStyle(fontSize: 24)),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _addPdfPage();
  }

  Future<void> _savePdf() async {
    try {
      final directory = await getTemporaryDirectory();
      final path = '${directory.path}/example.pdf';
      final file = File(path);
      await file.writeAsBytes(await pdf.save());

      // log('PDF saved at: $path', name: 'FilePath');

      setState(() {
        filePath = path;
      });

      if (!mounted) return;

      OpenFile.open(path);

      //
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('PDF saved successfully!')),
      // );

      // Open the PDF in the native PDF viewer

      // Print the saved PDF
      // _printPdf(path);
    } catch (e) {
      log(e.toString(), name: 'Error');

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save PDF: $e')),
      );
    }
  }

  Future<void> _printPdf(String path) async {
    try {
      // Print the PDF
      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => await File(path).readAsBytes(),
      );
    } catch (e) {
      log(e.toString(), name: 'Error');

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to print PDF: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: InkWell(
                onTap: _savePdf,
                child: const Text('Save & Print Pdf'),
              ),
            ),
            if (filePath != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Text('PDF Path: $filePath'),
              ),
          ],
        ),
      ),
    );
  }
}
