import 'package:flutter/material.dart';
import 'package:appgo/dashboard/ui/widget/search.dart';

class InputSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InputSearch();
  }
}

class _InputSearch extends State<InputSearch> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextEditingController _controller = TextEditingController();

    var solicitud;

    void dispose() {
      _controller.dispose();
    }

    void search() {
      solicitud = _controller.text;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Search(solicitud)));
    }

    final inputBusquda = Container(
      width: screenWidth * 0.80,
      child: TextField(
        textInputAction: TextInputAction.search,
        controller: _controller,
        maxLines: 1,
        autofocus: false,
        style: TextStyle(
            fontSize: 12.0,
            fontFamily: "DIN",
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFe5e5e5),
          border: InputBorder.none,
          hintText: '#Solicitud',
          suffixIcon: new IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.lightBlue,
              size: 30.0,
            ),
            onPressed: () {
              search();
            },
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFe5e5e5)),
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
          ),
        ),
        onSubmitted: (_controller) {
          search();
        },
      ),
    );

    return Column(
      children: <Widget>[inputBusquda],
    );
  }
}
