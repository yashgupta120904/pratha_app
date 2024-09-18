import 'package:flutter/material.dart';
import 'package:pratha_app/widgets/leading_custom.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RadioScreen extends StatefulWidget {
  @override
 _RadioScreenState createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition for Android WebView
    if (WebView.platform is AndroidWebView) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Padding(
            padding: const EdgeInsets.only(right: 70),
            child: LeadingCustom(title: "Radio")
          )
      ),
      body: WebView(
        initialUrl: 'https://prathaayurveda.caster.fm/',  // Your Shoutcast URL
        javascriptMode: JavascriptMode.unrestricted,      // Enable JS if needed
      ),
    );
  }
}
