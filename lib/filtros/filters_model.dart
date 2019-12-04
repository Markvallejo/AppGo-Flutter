import 'package:appgo/filtros/list_item.dart' as listItem_1;

class FiltersModel {
  List dateByItem = [
    new listItem_1.ListItemDate(
        id: 0, name: "5 días", description: "", days: 5),
    new listItem_1.ListItemDate(
        id: 1, name: "7 días", description: "", days: 7),
    new listItem_1.ListItemDate(
        id: 2, name: "2 semanas", description: "", days: 14),
    new listItem_1.ListItemDate(
        id: 3, name: "3 semanas", description: "", days: 21),
    new listItem_1.ListItemDate(
        id: 4, name: "1 mes", description: "", days: 30),
    new listItem_1.ListItemDate(
        id: 5, name: "2 meses", description: "", days: 60),
    new listItem_1.ListItemDate(
        id: 6, name: "4 meses", description: "", days: 80),
    new listItem_1.ListItemDate(
        id: 7, name: "1 año", description: "", days: 360),
    new listItem_1.ListItemDate(
        id: 8, name: "Selecciona una fecha...", description: "", days: -1),
  ];
}
