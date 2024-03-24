import 'dart:convert';

class BoatData {
  String name;
  String brand;
  String model;
  String year;
  String length;
  String price;
  String condition;
  String engineType;
  String fuelType;
  String power;
  String sailCount;
  String sailArea;

  BoatData({
    required this.name,
    required this.brand,
    required this.model,
    required this.year,
    required this.length,
    required this.price,
    required this.condition,
    required this.engineType,
    required this.fuelType,
    required this.power,
    required this.sailCount,
    required this.sailArea,
  });

  factory BoatData.fromList(List<String> boatDataList) {
    return BoatData(
      name: boatDataList[0],
      brand: boatDataList[1],
      model: boatDataList[2],
      year: boatDataList[3],
      length: boatDataList[4],
      price: boatDataList[5],
      condition: boatDataList[6],
      engineType: boatDataList[7],
      fuelType: boatDataList[8],
      power: boatDataList[9],
      sailCount: boatDataList[10],
      sailArea: boatDataList[11],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'brand': brand,
      'model': model,
      'year': year,
      'length': length,
      'price': price,
      'condition': condition,
      'engineType': engineType,
      'fuelType': fuelType,
      'power': power,
      'sailCount': sailCount,
      'sailArea': sailArea,
    };
  }

  factory BoatData.fromMap(Map<String, dynamic> map) {
    return BoatData(
      name: map['name'],
      brand: map['brand'],
      model: map['model'],
      year: map['year'],
      length: map['length'],
      price: map['price'],
      condition: map['condition'],
      engineType: map['engineType'],
      fuelType: map['fuelType'],
      power: map['power'],
      sailCount: map['sailCount'],
      sailArea: map['sailArea'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BoatData.fromJson(String source) =>
      BoatData.fromMap(json.decode(source));

  // Hinzugefügter Getter für 'fuel'
  String get fuel => fuelType;
}
