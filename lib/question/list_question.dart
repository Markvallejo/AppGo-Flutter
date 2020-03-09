import "package:appgo/question/question.dart";
import 'package:mobx/mobx.dart';

class ListQuestion {
  ObservableList<Question> _items = ObservableList<Question>();
  num _lastSelectedIndex = -1;
  num _currentSelectedIndex = -1;

  ObservableList<Question> get items => _items;

  set items(ObservableList<Question> data) {
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
