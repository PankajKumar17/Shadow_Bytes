import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'bill_page.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isFlashOn = false;
  bool isScanning = true; // Prevent multiple scans

  @override
  void reassemble() {
    super.reassemble();
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Scanner')),
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.blueAccent,
              borderRadius: 12,
              borderLength: 30,
              borderWidth: 8,
              cutOutSize: MediaQuery.of(context).size.width * 0.7,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        isFlashOn ? Icons.flash_on : Icons.flash_off,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        await controller?.toggleFlash();
                        setState(() {
                          isFlashOn = !isFlashOn;
                        });
                      },
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(
                        Icons.flip_camera_android,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        await controller?.flipCamera();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

void _onQRViewCreated(QRViewController controller) {
  setState(() {
    this.controller = controller;
  });

  controller.scannedDataStream.listen((scanData) {
    if (isScanning) {
      isScanning = false; // Prevent multiple scans

      debugPrint("🔍 Scanned Data (Raw): ${scanData.code}");

      // Replace single quotes with double quotes to make it valid JSON
      String jsonString = scanData.code!
          .replaceAll("'", "\""); 

      debugPrint("🔍 Scanned Data (Fixed JSON): $jsonString");

      // Navigate back with corrected JSON string
      Navigator.pop(context, jsonString);
    }
  });
}


  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
