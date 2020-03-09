import 'package:appgo/question/question.dart';
import "package:appgo/question/list_question.dart";
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:mobx/mobx.dart';

// ignore: mixin_inherits_from_not_object
class QuestionModel with PropertyChangeNotifier<String> {
  ListQuestion _questionList;

  Question _question;

  QuestionModel() {
    this._questionList = new ListQuestion();

    this.sortQuestion = new ObservableList.of([
      new Question(
          idQuestion: 0,
          encabezado: "¿Qué es el Centro de Servicio al Cliente GM Financial?",
          contenido:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nNam eu sollicitudin tellus, a molestie velit. Donec posuere metus ut ex fermentum tempor. Nulla finibus viverra condimentum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec",
          selected: false),
      new Question(
          idQuestion: 1,
          encabezado: "¿Cómo obtengo mi número de contrato o referencia?",
          contenido:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sollicitudin tellus, a molestie velit. Donec posuere metus ut ex fermentum tempor. Nulla finibus viverra condimentum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec",
          selected: true),
      new Question(
          idQuestion: 2,
          encabezado: "¿Cómo accedo a mi Estado de Cuenta?",
          contenido:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sollicitudin tellus, a molestie velit. Donec posuere metus ut ex fermentum tempor. Nulla finibus viverra condimentum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec",
          selected: false),
      new Question(
          idQuestion: 3,
          encabezado:
              "¿Si estoy por adquirir un crédito automotriz, ¿puedo contratar el seguro de auto por mi cuenta?",
          contenido:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sollicitudin tellus, a molestie velit. Donec posuere metus ut ex fermentum tempor. Nulla finibus viverra condimentum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec",
          selected: false),
      new Question(
          idQuestion: 4,
          encabezado: "¿Qué es el Centro de Servicio al Cliente GM Financial?",
          contenido:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nNam eu sollicitudin tellus, a molestie velit. Donec posuere metus ut ex fermentum tempor. Nulla finibus viverra condimentum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec",
          selected: false),
      new Question(
          idQuestion: 5,
          encabezado: "¿Cómo obtengo mi número de contrato o referencia?",
          contenido:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sollicitudin tellus, a molestie velit. Donec posuere metus ut ex fermentum tempor. Nulla finibus viverra condimentum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec",
          selected: false),
      new Question(
          idQuestion: 6,
          encabezado: "¿Cómo accedo a mi Estado de Cuenta?",
          contenido:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sollicitudin tellus, a molestie velit. Donec posuere metus ut ex fermentum tempor. Nulla finibus viverra condimentum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec",
          selected: false),
      new Question(
          idQuestion: 7,
          encabezado:
              "¿Si estoy por adquirir un crédito automotriz, ¿puedo contratar el seguro de auto por mi cuenta?",
          contenido:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sollicitudin tellus, a molestie velit. Donec posuere metus ut ex fermentum tempor. Nulla finibus viverra condimentum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec",
          selected: false),
      new Question(
          idQuestion: 8,
          encabezado: "¿Qué es el Centro de Servicio al Cliente GM Financial?",
          contenido:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nNam eu sollicitudin tellus, a molestie velit. Donec posuere metus ut ex fermentum tempor. Nulla finibus viverra condimentum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec",
          selected: false),
      new Question(
          idQuestion: 9,
          encabezado: "¿Cómo obtengo mi número de contrato o referencia?",
          contenido:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sollicitudin tellus, a molestie velit. Donec posuere metus ut ex fermentum tempor. Nulla finibus viverra condimentum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec",
          selected: false),
      new Question(
          idQuestion: 10,
          encabezado: "¿Cómo accedo a mi Estado de Cuenta?",
          contenido:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sollicitudin tellus, a molestie velit. Donec posuere metus ut ex fermentum tempor. Nulla finibus viverra condimentum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec",
          selected: false),
      new Question(
          idQuestion: 11,
          encabezado:
              "¿Si estoy por adquirir un crédito automotriz, ¿puedo contratar el seguro de auto por mi cuenta?",
          contenido:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sollicitudin tellus, a molestie velit. Donec posuere metus ut ex fermentum tempor. Nulla finibus viverra condimentum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec",
          selected: false),
    ]);
  }

  ObservableList<Question> get sortByQuestion => this._questionList.items;

  set sortQuestion(ObservableList<Question> data) {
    this._questionList.items = data;
  }
}
