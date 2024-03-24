import 'package:flutter/material.dart';

class CommercialAddress extends StatefulWidget {
  final Function(String) onAddressEntered;

  const CommercialAddress({super.key, required this.onAddressEntered});

  @override
  // ignore: library_private_types_in_public_api
  _CommercialAddressState createState() => _CommercialAddressState();
}

class _CommercialAddressState extends State<CommercialAddress> {
  final _formKey = GlobalKey<FormState>();
  final _companyNameController = TextEditingController();
  final _streetController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _cityController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailAddressController = TextEditingController();

  final bool _isCommercialProvider = false;

  void _saveForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final address = _getAddress();
      widget.onAddressEntered(address);
      Navigator.pop(context);
    }
  }

  String _getAddress() {
    String address = '';
    // Konstruieren Sie hier die Adresse
    address += '${_companyNameController.text}, ';
    address += '${_streetController.text}, ';
    address += '${_postalCodeController.text} ';
    address += _cityController.text;
    return address;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: _openPopupContent(context),
    );
  }

  Widget _openPopupContent(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _companyNameController,
            decoration: const InputDecoration(
              labelText: 'Firmenname',
            ),
            validator: (value) {
              if (_isCommercialProvider && (value == null || value.isEmpty)) {
                return 'Bitte geben Sie einen Firmennamen ein.';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _streetController,
            decoration: const InputDecoration(
              labelText: 'Straße',
            ),
            validator: (value) {
              if (_isCommercialProvider && (value == null || value.isEmpty)) {
                return 'Bitte geben Sie eine Straße ein.';
              }
              return null;
            },
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _postalCodeController,
                  decoration: const InputDecoration(
                    labelText: 'PLZ',
                  ),
                  validator: (value) {
                    if (_isCommercialProvider &&
                        (value == null || value.isEmpty)) {
                      return 'Bitte geben Sie eine PLZ ein.';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    labelText: 'Stadt',
                  ),
                  validator: (value) {
                    if (_isCommercialProvider &&
                        (value == null || value.isEmpty)) {
                      return 'Bitte geben Sie eine Stadt ein.';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          TextFormField(
            controller: _phoneNumberController,
            decoration: const InputDecoration(
              labelText: 'Telefonnummer',
            ),
            validator: (value) {
              if (_isCommercialProvider && (value == null || value.isEmpty)) {
                return 'Bitte geben Sie eine Telefonnummer ein.';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _emailAddressController,
            decoration: const InputDecoration(
              labelText: 'E-Mail-Adresse',
            ),
            validator: (value) {
              if (_isCommercialProvider && (value == null || value.isEmpty)) {
                return 'Bitte geben Sie eine E-Mail-Adresse ein.';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: _isCommercialProvider ? () => _saveForm(context) : null,
            child: const Text('Speichern'),
          ),
        ],
      ),
    );
  }
}
