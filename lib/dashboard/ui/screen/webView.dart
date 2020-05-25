import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  String url;
  String title;
  MyWebView(this.url, this.title);

  @override
  State<StatefulWidget> createState() {
    return _MyWebView();
  }
}

class _MyWebView extends State<MyWebView> {
  @override
  Widget build(BuildContext context) {
    WebViewController _controller;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.lightBlueAccent[400], Colors.lightBlue[600]],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(0.0, 0.6),
              stops: [0.0, 0.0],
              tileMode: TileMode.clamp,
            )),
          ),
          elevation: 0.0,
          leading: Container(
            margin: EdgeInsets.only(top: 15.0),
            child: Builder(
              builder: (context) => IconButton(
                  icon: new Icon(Icons.chevron_left),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ),
          centerTitle: true,
          title: Container(
            margin: EdgeInsets.only(top: 15.0),
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "INPro-Bold",
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
            },
          ),
        ],
      ),
    );
  }
}
