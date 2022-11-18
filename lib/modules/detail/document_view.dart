import 'package:adept_drive/utils/styles.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

// this temp class
class DocumentView extends StatefulWidget {
  const DocumentView({super.key});

  static const routeName = '/doc_view';

  @override
  State<DocumentView> createState() => _DocumentViewState();
}

class _DocumentViewState extends State<DocumentView> {
  bool _isLoading = true;
  late PDFDocument document;
  final String documentPath = Get.arguments;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromURL(documentPath);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Document View',
        ),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : documentPath.contains('.pdf')
                ? PDFViewer(document: document)
                : documentPath.contains('.jpg')
                    ? Image.network(documentPath)
                    : documentPath.contains('.png')
                        ? Image.network(documentPath)
                        : WebView(
                            initialUrl:
                                'https://docs.google.com/gview?embedded=true&url=$documentPath',
                            javascriptMode: JavascriptMode.unrestricted,
                          ),
      ),
    );
  }
}
