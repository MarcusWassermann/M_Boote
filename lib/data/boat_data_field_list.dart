
import 'package:flutter/material.dart';
import 'package:m_boote/data/boat_data.dart';
import 'package:m_boote/widgets/boatdatafield.dart';

class BoatDataFieldsList extends StatefulWidget {
  final void Function(BoatData boatData) onBoatDataReceived;

  const BoatDataFieldsList({super.key, required this.onBoatDataReceived});

  @override
  State<BoatDataFieldsList> createState() => _BoatDataFieldsListState();
}

class _BoatDataFieldsListState extends State<BoatDataFieldsList> {
  final List<String> _boatData = [
    '', // 0: Name des Boots
    '', // 1: Preis
    '', // 2: Marke
    '', // 3: Modell
    '', // 4: Baujahr
    '', // 5: Länge
    '', // 6: Zustand
    '', // 7: Motorart
    '', // 8: Kraftstoff
    '', // 9: Leistung
    '', // 10: Segel Anzahl
    '', // 11: Segel qm
  ];

  void _updateBoatData(int index, String value) {
    setState(() {
      _boatData[index] = value;
      widget.onBoatDataReceived(BoatData.fromList(_boatData));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BoatDataField(
          index: 0,
          label: 'Name des Boots',
          onChanged: (value) => _updateBoatData(0, value),
        ),
        BoatDataField(
          index: 1,
          label: 'Preis',
          onChanged: (value) => _updateBoatData(1, value),
        ),
        BoatDataField(
          index: 2,
          label: 'Marke',
          onChanged: (value) => _updateBoatData(2, value),
        ),
        BoatDataField(
          index: 3,
          label: 'Modell',
          onChanged: (value) => _updateBoatData(3, value),
        ),
        BoatDataField(
          index: 4,
          label: 'Baujahr',
          onChanged: (value) => _updateBoatData(4, value),
        ),
        BoatDataField(
          index: 5,
          label: 'Länge',
          onChanged: (value) => _updateBoatData(5, value),
        ),
        BoatDataField(
          index: 6,
          label: 'Zustand',
          onChanged: (value) => _updateBoatData(6, value),
        ),
        BoatDataField(
          index: 7,
          label: 'Motorart',
          onChanged: (value) => _updateBoatData(7, value),
        ),
        BoatDataField(
          index: 8,
          label: 'Kraftstoff',
          onChanged: (value) => _updateBoatData(8, value),
        ),
        BoatDataField(
          index: 9,
          label: 'Leistung',
          onChanged: (value) => _updateBoatData(9, value),
        ),
        BoatDataField(
          index: 10,
          label: 'Segel Anzahl',
          onChanged: (value) => _updateBoatData(10, value),
        ),
        BoatDataField(
          index: 11,
          label: 'Segel qm',
          onChanged: (value) => _updateBoatData(11, value),
        ),
      ],
    );
  }
}
