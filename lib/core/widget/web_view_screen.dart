// import 'package:flutter/material.dart';
// import 'package:flutter_webview_pro/webview_flutter.dart';

// class WebViewScren extends StatelessWidget {
//   final String urlWebViewScreen;
//   const WebViewScren(this.urlWebViewScreen, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child:

//      WebView(initialUrl: urlWebViewScreen.toString()));

//   }
// }
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class WebViewScren extends StatelessWidget {
//   final String urlWebViewScreen;
//   const WebViewScren(this.urlWebViewScreen, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Web View")),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             final uri = Uri.parse(urlWebViewScreen);
//             await launchUrl(
//               uri,
//               mode: LaunchMode.inAppBrowserView,
//             );
//           },
//           child: const Text("فتح الصفحة"),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  const WebViewScreen({super.key, required this.url});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
      );
  }

  Future<bool> _onWillPop() async {
    // لو الصفحة تقدر ترجع للصفحة السابقة داخل WebView
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return false; // متروحش لصفحة سابقة في التطبيق
    }
    return true; // ترجع للخلف عادي
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop, // التحكم في زر الرجوع
      child: Scaffold(
        appBar: AppBar(title: const Text('News Details')),
        body: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (_isLoading) const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
