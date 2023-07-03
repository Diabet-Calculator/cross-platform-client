import 'dart:async';
import 'package:dcalculator/classes.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class SetItem {
  int index;
  String value;

  SetItem({required int this.index, required String this.value});
}

class CalculatorBloc {
  double _totalInsulin = 0;
  late List<Carbohydrates> _carbohydrateList;
  late final Map<int, TextEditingController> _weightControllerList = {};
  late final Map<int, TextEditingController> _carbohydratesControllerList = {};
  late int lastIndex = 0;

  CalculatorBloc() {
    _carbohydrateList = [Carbohydrates(0, "Гречка", 100, 0)];
    _weightControllerList[0] = TextEditingController(text: "100");
    _carbohydratesControllerList[0] = TextEditingController(text: "0");
    _actionAddController.stream.listen(_addItemToList);
    _actionRemoveController.stream.listen(_removeItemFromList);
    _addItem.add(_carbohydrateList);
    lastIndex = lastIndex + 1;

    _actionUpdateTotalInsulinController.stream.listen(_updateTotalInsulin);

    _actionSetWeight.stream.listen(_setWeightToItem);
    _actionSetCarbohydrates.stream.listen(_setCarbohydratesToItem);

    _actionUpdateTotalInsulinController.add(null);
  }

  TextEditingController? getWeightController(int id) {
    return _weightControllerList[id];
  }

  TextEditingController? getCarbohydratesController(int id) {
    return _carbohydratesControllerList[id];
  }

  final _listStream = BehaviorSubject<List<Carbohydrates>>.seeded([]);
  final _totalInsulinStream = BehaviorSubject<double>.seeded(0);

  Stream<double> get totalInsulin => _totalInsulinStream.stream;
  Sink get _totalInsulinSink => _totalInsulinStream.sink;

  final StreamController<void> _actionUpdateTotalInsulinController = StreamController();
  StreamSink get updateTotalInsulin => _actionUpdateTotalInsulinController.sink;

  Stream<List<Carbohydrates>> get list => _listStream.stream;
  Sink get _addItem => _listStream.sink;

  final StreamController<Carbohydrates?> _actionAddController = StreamController();
  StreamSink get addToList => _actionAddController.sink;

  final StreamController<int> _actionRemoveController = StreamController();
  StreamSink get removeFromList => _actionRemoveController.sink;

  final StreamController<SetItem> _actionSetWeight = StreamController();
  StreamSink<SetItem> get setWeight => _actionSetWeight.sink;

  final StreamController<SetItem> _actionSetCarbohydrates = StreamController();
  StreamSink<SetItem> get setCarbohydrates => _actionSetCarbohydrates.sink;

  void _updateTotalInsulin(void none) {
    _totalInsulin = Calculator.calculateTotalInsulin(_carbohydrateList);
    _totalInsulinSink.add(_totalInsulin);
  }

  void _addItemToList(Carbohydrates? carbohydrates) {
    _weightControllerList[lastIndex] = TextEditingController(text: "100");
    _carbohydratesControllerList[lastIndex] = TextEditingController(text: "0");
    _carbohydrateList.add(Carbohydrates(lastIndex, "", 100, 0));
    _addItem.add(_carbohydrateList);
    lastIndex = lastIndex + 1;
    _actionUpdateTotalInsulinController.add(null);
  }

  void _removeItemFromList(int index) {
    _weightControllerList.remove(_carbohydrateList[index].id);
    _carbohydratesControllerList.remove(_carbohydrateList[index].id);
    _carbohydrateList.removeAt(index);
    _addItem.add(_carbohydrateList);
    _actionUpdateTotalInsulinController.add(null);
  }

  void _setWeightToItem(SetItem setItem) {
    _carbohydrateList[setItem.index].weight = int.parse(setItem.value);
    _addItem.add(_carbohydrateList);
    _actionUpdateTotalInsulinController.add(null);
  }

  void _setCarbohydratesToItem(SetItem setItem) {
    _carbohydrateList[setItem.index].carbohydrates = int.parse(setItem.value);
    _addItem.add(_carbohydrateList);
    _actionUpdateTotalInsulinController.add(null);
  }

  void dispose() {
    _listStream.close();
    _actionAddController.close();
    _actionRemoveController.close();
    _actionSetWeight.close();
    _actionSetCarbohydrates.close();
  }
}