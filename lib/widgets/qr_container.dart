import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrContainer extends StatelessWidget {
  const QrContainer({super.key, required this.qrPainter}) : url = null;
  const QrContainer.url({super.key, required this.url}) : qrPainter = null;

  final QrPainter? qrPainter;
  final String? url;

  BoxDecoration get _boxDecoration => BoxDecoration(
      borderRadius: BorderRadius.circular(10), color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _boxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: qrPainter != null
            ? FutureBuilder(
                future: qrPainter!.toImageData(150),
                builder: (_, snap) {
                  if (snap.hasData) {
                    return Image.memory(snap.data!.buffer.asUint8List());
                  }
                  return const Center(child: CircularProgressIndicator());
                })
            : SizedBox.square(
                dimension: 125,
                child: Image.network(
                  url ?? "",
                  errorBuilder: (context, error, stackTrace) =>
                      DecoratedBox(decoration: _boxDecoration),
                ),
              ),
      ),
    );
  }
}
