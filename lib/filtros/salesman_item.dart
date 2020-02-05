import 'package:mobx/mobx.dart';
import 'package:appgo/filtros/list_item.dart';

ObservableList<ListItem> mapList(List data) {
  var list = new ObservableList<ListItem>();

  for (var i = 0; i < data.length; i++) {
    String idVendedor = data.first;
    String nombreVendedor = data.last;

    var item = new ListItem(
      id: i,
      name: nombreVendedor,
      description: "",
      data: idVendedor,
    );
    list.add(item);
  }

  return list;
}
