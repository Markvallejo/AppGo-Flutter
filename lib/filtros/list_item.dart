import 'package:property_change_notifier/property_change_notifier.dart';

//ignore: mixin_inherits_from_not_object
class ListItem with PropertyChangeNotifier<String> {
  bool _selected;
  int _id;
  String _name;
  String _description;
  dynamic _data;

  get data => _data;

  set data(dynamic value) {
    this._data = value;
  }

  bool get selected => this._selected;

  set selected(bool value) {
    this._selected = value;
    this.notifyListeners("selected");
  }

  String get name => _name;

  set name(String value) {
    if (this._name != value) {
      this._name = value;
      this.notifyListeners("name");
    }
  }

  String get description => this._description;

  set description(String value) {
    if (this._description != value) {
      this._description = value;
      this.notifyListeners("description");
    }
  }

  int get id => _id;

  set id(int value) {
    if (this._id != value) {
      this._id = value;
      this.notifyListeners("id");
    }
  }

  ListItem({int id, String name, String description, dynamic data}) {
    this.id = id;
    this.name = name.trim();
    this.description = description.trim();
    this.selected = false;
    this.data = data;
  }
}
