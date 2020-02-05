import 'package:appgo/filtros/list_item.dart';
import 'package:appgo/filtros/list_model.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:mobx/mobx.dart';

// ignore: mixin_inherits_from_not_object
class FiltersModel with PropertyChangeNotifier<String> {
  ListModel _salesmanList;
  ListModel _sortByList;
  ListModel _dateByList;

  ListItem _sortBy;
  ListItem _dateBy;
  ListItem _salesman;

  bool all_sections_available = true;
  num user_countryCode = 1;
  bool isLatam = false;

  FiltersModel() {
    this._salesmanList = new ListModel();
    this._sortByList = new ListModel();
    this._dateByList = new ListModel();

    this.sortByItems = new ObservableList.of([
      new ListItem(id: 0, name: "Nombre", description: "A-Z", data: 1),
      new ListItem(id: 1, name: "Nombre", description: "Z-A", data: 2),
      new ListItem(id: 2, name: "No Solicitud", description: "0-9", data: 3),
      new ListItem(id: 3, name: "No Solicitud", description: "9-0", data: 4),
      new ListItem(id: 4, name: "Fecha", description: "- +", data: 5),
      new ListItem(id: 5, name: "Fecha", description: "+ -", data: 6),
    ]);

    this.dateByItems = new ObservableList.of([
      new ListItem(id: 0, name: "5 días", description: "", data: 5),
      new ListItem(id: 1, name: "7 días", description: "", data: 7),
      new ListItem(id: 2, name: "2 semanas", description: "", data: 14),
      new ListItem(id: 3, name: "3 semanas", description: "", data: 21),
      new ListItem(id: 4, name: "1 mes", description: "", data: 30),
      new ListItem(id: 5, name: "2 meses", description: "", data: 60),
      new ListItem(id: 6, name: "4 meses", description: "", data: 80),
      new ListItem(id: 7, name: "1 año", description: "", data: 360),
      new ListItem(
          id: 8, name: "Selecciona una fecha...", description: "", data: -1),
    ]);

    this.setSelectedSortByItemAtIndex(0);
    this.setSelectedDateByItemAtIndex(0);
  }

  ListItem get sortBy => this._sortBy;

  set sortBy(ListItem value) {
    if (this._sortBy != value) {
      this._sortBy = value;
      this.notifyListeners("sortBy");
    }
  }

  ListItem get dateBy => this._dateBy;

  set dateBy(ListItem value) {
    if (this._dateBy != value) {
      this._dateBy = value;
      this.notifyListeners("dateBy");
    }
  }

  ListItem get salesman => this._salesman;

  set salesman(ListItem value) {
    if (this._salesman != value) {
      this._salesman = value;
      this.notifyListeners("salesman");
    }
  }

  ObservableList<ListItem> get salesmanItems => this._salesmanList.items;

  set salesmanItems(ObservableList<ListItem> data) {
    this._salesmanList.items = data;
  }

  ObservableList<ListItem> get sortByItems => this._sortByList.items;

  set sortByItems(ObservableList<ListItem> data) {
    this._sortByList.items = data;
  }

  ObservableList<ListItem> get dateByItems => this._dateByList.items;

  set dateByItems(ObservableList<ListItem> data) {
    this._dateByList.items = data;
  }

  void setDateByItemsFromArray(List<num> value) {
    List<ListItem> items = [];
    for (var i = 0; i < value.length; i++) {
      // logger.log("adding date: ", value[i] + " días");
      items.add(new ListItem(
          id: i,
          name: value[i].toString() + "dias",
          description: "",
          data: value[i]));
    }
    this.dateByItems = new ObservableList(); // falta el items valor
  }

  void setSelectedSortByItemAtIndex(num value) {
    this._sortByList.setSelectecItemAtIndex(value);
    this.sortBy = this.sortByItems.elementAt(value); // pendiente
  }

  void setSelectedDateByItemAtIndex(num value) {
    this._dateByList.setSelectecItemAtIndex(value);
    this.dateBy = this.dateByItems.elementAt(value); //pendiente
  }

  void setSelectedSalesmanAtIndex(num value) {
    this._salesmanList.setSelectecItemAtIndex(value);
    this.salesman = this.salesmanItems.elementAt(value); //pendiente
  }
}
