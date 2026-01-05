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

class WebViewScren extends StatefulWidget {
  final String urlWebViewScreen;
  const WebViewScren(this.urlWebViewScreen, {super.key});

  @override
  State<WebViewScren> createState() => _WebViewScrenState();
}

class _WebViewScrenState extends State<WebViewScren> {
  @override
  void initState() {
    super.initState();
    _openUrl();
  }

  Future<void> _openUrl() async {
    final uri = Uri.parse(widget.urlWebViewScreen);
    await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Loading بسيط
      ),
    );
  }
}
