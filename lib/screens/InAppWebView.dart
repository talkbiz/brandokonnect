
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:webview_flutter/webview_flutter.dart';



class InAppWebView extends StatefulWidget {
  final String url;
  final String name;
  const InAppWebView(  {super.key, required this.url, required this.name});



  @override
  State<InAppWebView> createState() => _InAppWebViewState();
}

Size? screenSize;
class _InAppWebViewState extends State<InAppWebView> {
  late final WebViewController _controller;

  final String htmlLoading = '''
   <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Loading Animation</title>
<style>
  body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    background-color: #f0f0f0;
  }

  .loading-container {
    text-align: center;
  }

  .loading-text {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 10px;
    color: #000066;
    text-align: center;
  }

  .loading-spinner {
    border: 4px solid rgba(0, 0, 0, 0.1);
    border-top: 4px solid #3498db;
    border-radius: 50%;
    width: 40px;
    height: 40px;
    animation: spin 1s linear infinite;
  }

  @keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
  }
</style>
</head>
<body>
  <div class="loading-container">
    <div class="loading-spinner"></div>
    <div class="loading-text">Loading...</div>
  </div>
</body>
</html>

  ''';


  final String htmlError = '''
   <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>No Internet Connection Animation</title>
<style>
  body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    background-color: #f0f0f0;
  }

  .error-container {
    text-align: center;
  }

  .error-icon {
    font-size: 48px;
    color: #000055;
    margin-bottom: 10px;
  }

  .error-text {
    font-size: 24px;
    font-weight: bold;
    color: #000066;
  }

  .blink {
    animation: blink 1s infinite;
  }

  @keyframes blink {
    0%, 100% { opacity: 0.6; }
    50% { opacity: 0; }
  }
</style>
</head>
<body>
  <div class="error-container">
    <div class="error-icon">&#9888;</div>
    <div class="error-text blink">Check Internet Connection</div>
  </div>
</body>
</html>


  ''';


  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();

    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    params = const PlatformWebViewControllerCreationParams();

    final WebViewController controller =
    WebViewController.fromPlatformCreationParams(params);

    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadHtmlString(htmlLoading)
      
      ..setBackgroundColor(const Color(0x00000000))
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (WebResourceError error){
            _controller.loadHtmlString(htmlError);

          },
            onProgress: (int progress) {

              print('WebView is loading (progress : $progress%)');
            },
            onPageStarted: (String url) {
            


              setState(() {

              });
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {

              print('Page finished loading: $url');
            }));;

    _controller = controller;
    _controller.loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(title: Text(widget.name),),
      body: SafeArea(
          child:
          Stack(
              children:[
                WebViewWidget(controller: _controller,
                ),
              ])),
    );
  }
}
