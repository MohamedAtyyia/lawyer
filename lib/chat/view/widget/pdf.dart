import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class ShowPdf extends StatelessWidget {
  const ShowPdf({super.key, required this.pdf});
  final String pdf;

  @override
  Widget build(BuildContext context) {
    print(pdf);
    return Scaffold(
      body: PDF(nightMode: false).cachedFromUrl(
        pdf,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) {
          return Center(child: Text(error.toString()));
        },
      ),
    );
  }
}
