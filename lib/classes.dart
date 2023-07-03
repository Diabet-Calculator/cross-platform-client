import 'dart:developer';

class Carbohydrates {
  late int id;
  late String name;
  late int weight;
  late int carbohydrates;

  Carbohydrates(this.id, this.name,this.weight,this.carbohydrates);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'weight': weight,
      'carbohydrates': carbohydrates,
    };
  }

  dynamic get(String propertyName) {
    var mapRep = toMap();
    if (mapRep.containsKey(propertyName)) {
      return mapRep[propertyName];
    }
    throw ArgumentError('propery not found');
  }
}

class Calculator {
  static double calculateTotalInsulin(List<Carbohydrates> carbohydratesList) {
    double totalInsulin = 0.0;

    for (final element in carbohydratesList) {
      double totalCarbohydratesForElement = (element.weight / 100) * element.carbohydrates;
      double totalInsulinForElement = (totalCarbohydratesForElement / 12) * 1.25;

      totalInsulin += totalInsulinForElement;
    }

    return totalInsulin;
  }
}