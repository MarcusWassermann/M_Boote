
import 'package:flutter/material.dart';
import 'package:m_boote/data/boat_data.dart';
import 'package:m_boote/data/boat_data_field_list.dart';
import 'package:m_boote/paymant_page/payment_screen.dart';
import 'package:m_boote/postad_page/commercial_address.dart';
import 'package:m_boote/third_page/name_and_price.dart';
import 'package:m_boote/widgets/image_upload.dart';


class PostAdScreen extends StatefulWidget {
  const PostAdScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PostAdScreenState createState() => _PostAdScreenState();
}

class _PostAdScreenState extends State<PostAdScreen> {
  final TextEditingController _adTextController = TextEditingController();
  bool _isCommercial = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Image(
            image: AssetImage('assets/logo-transparent-png.png'),
            height: 50,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: TextField(
                  controller: _adTextController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Geben Sie hier Ihre Anzeige ein',
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const Text('Bootsdaten:', style: TextStyle(fontSize: 18.0)),
              BoatDataFieldsList(onBoatDataReceived: _handleBoatDataReceived),
              const SizedBox(height: 8.0),
              const Text('Anbieterart:', style: TextStyle(fontSize: 18.0)),
              Row(
                children: [
                  Checkbox(
                    value: _isCommercial,
                    onChanged: (value) {
                      setState(() {
                        _isCommercial = value ?? false;
                      });
                      if (_isCommercial) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CommercialAddress(
                              onAddressEntered: (address) {
                                // handle commercial address data
                              },
                            );
                          },
                        );
                      }
                    },
                  ),
                  const Text('Gewerblicher Anbieter'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: !_isCommercial,
                    onChanged: (value) {
                      setState(() {
                        _isCommercial = !value!;
                      });
                    },
                  ),
                  const Text('Privat'),
                ],
              ),
              const SizedBox(height: 20.0),
              const ImageUploadWidget(),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Navigate to Payment Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentScreen(adPrice: 1.99),
                    ),
                  );
                },
                child: const Text('Anzeige aufgeben'),
              ),
              const SizedBox(height: 20.0),
              NameAndPrice(
                  isCommercial:
                      _isCommercial), // NameAndPrice Widget hinzufügen
            ],
          ),
        ),
      ),
    );
  }

  void _handleBoatDataReceived(BoatData boatData) {
    // handle received boat data
  }
}
