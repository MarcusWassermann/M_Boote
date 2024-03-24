import 'package:flutter/material.dart';

class CommercialCheckbox extends StatefulWidget {
  final void Function(bool isCommercial)? onChanged;

  const CommercialCheckbox({super.key, this.onChanged});

  @override
  // ignore: library_private_types_in_public_api
  _CommercialCheckboxState createState() => _CommercialCheckboxState();
}

class _CommercialCheckboxState extends State<CommercialCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value ?? false;
          widget.onChanged?.call(isChecked);
        });
      },
    );
  }
}
