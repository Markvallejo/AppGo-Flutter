import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:appgo/dashboard/ui/widget/search_result.dart';

class InputSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InputSearch();
  }
}

class Post {
  var request;
  Post(this.request);
}

class _InputSearch extends State<InputSearch> {
  @override
  Widget build(BuildContext context) {
    Future<List<Post>> search(var search) async {
      await Future.delayed(Duration(seconds: 2));
      var cad = new RegExp('[a-zA-Z_*+@#\/\-]', caseSensitive: false);
      var resp = cad.hasMatch(search);
      if (resp == true) {
        throw Error();
      } else
        return List.generate(1, (int index) {
          return Post(search);
        });
    }

    final searchBar = Container(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: SearchBar<Post>(
          searchBarPadding: EdgeInsets.only(left: 20.0, right: 20.0),
          textStyle: TextStyle(
            fontFamily: "DIN",
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black38,
          ),
          hintText: "Solicitud",
          icon: new Icon(
            Icons.search,
            color: Colors.lightBlue,
          ),
          cancellationText: Text("Cancelar"),
          minimumChars: 6,
          loader: Container(
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white12,
                valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
              ),
            ),
          ),
          onSearch: search,
          onItemFound: (Post post, int index) {
            return SearchResult(post.request);
          },
          onError: (error) {
            return Container(
              child: Center(
                child: Text("Error, solo se admiten numeros"),
              ),
            );
          },
        ),
      ),
    );

    return searchBar;
  }
}
