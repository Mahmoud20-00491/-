import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  runApp(MyAppImpl());
}

abstract class MyAppBase extends StatelessWidget {
  void registerWebViewWebImplementation();

  const MyAppBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    registerWebViewWebImplementation();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class MyAppImpl extends MyAppBase {
  @override
  void registerWebViewWebImplementation() {
    WebView.platform = SurfaceAndroidWebView();
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          key: _key,
          initialUrl: 'https://nabdelqanon.com/home/',
          javascriptMode: JavascriptMode.unrestricted,
          
  },

        ),
      ),
    );
  }
}
