import 'package:appgo/filtros/list_item.dart';
import 'package:mobx/mobx.dart';

class ListModel {
  ObservableList<ListItem> _items = ObservableList<ListItem>();
  num _lastSelectedIndex = -1;
  num _currentSelectedIndex = -1;

  ObservableList<ListItem> get items => _items;

  set items(ObservableList<ListItem> data) {
    this._items = data;
  }

  setSelectecItemAtIndex(num itemIndex) {
    //logger.log("ListModel.setSelectecItemAtIndex: ", itemIndex)

    if (this._currentSelectedIndex != itemIndex) {
      this._lastSelectedIndex = this._currentSelectedIndex;
      this._currentSelectedIndex = itemIndex;

      var selectedItem =
          this._items.first; //getItem(this._currentSelectedIndex);
      selectedItem.selected = true;

      var lasItem = this._items.last;
      if (lasItem.selected) {
        lasItem.selected = false;
      }

      // logger.log("selected item:", selectedItem.get("name"))
      // logger.log("selected item:", selectedItem.get("id"))
      // logger.log("selected item:", selectedItem.get("selected"))
    }
  }

  reset() {
    var selectedItem = this.items.first;
    if (selectedItem.selected) {
      selectedItem.selected = false;
    }

    var lasItem = this.items.last;
    if (lasItem.selected) {
      lasItem.selected = false;
    }
  }
}
