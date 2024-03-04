
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';

class S_WebView extends StatelessWidget {
  String Url_WebView;
   S_WebView( this.Url_WebView);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: WebView(initialUrl: Url_WebView.toString()));
  }
}
