import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:m_boote/data/commercial_address_data.dart';

class FourthScreen extends StatelessWidget {
  final CommercialAddressData? commercialAddressData;

  const FourthScreen({super.key, this.commercialAddressData});

  @override
  Widget build(BuildContext context) {
    if (commercialAddressData == null) {
      // Behandlung, wenn commercialAddressData null ist
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent, // Transparente Hintergrundfarbe
          elevation: 0, // Kein Schatten
        ),
        body: const Center(
          child: Text('Commercial Address Data is null.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const SizedBox.shrink(), // Titel entfernen
        backgroundColor: Colors.transparent, // Transparente Hintergrundfarbe
        elevation: 0, // Kein Schatten
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  commercialAddressData!.latitude,
                  commercialAddressData!.longitude,
                ),
                zoom: 15,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('vendor_location'),
                  position: LatLng(
                    commercialAddressData!.latitude,
                    commercialAddressData!.longitude,
                  ),
                  infoWindow: InfoWindow(
                    title: commercialAddressData!.companyName,
                    snippet: commercialAddressData!.address,
                  ),
                ),
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Anbieter: ${commercialAddressData!.companyName}\n${commercialAddressData!.address}',
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
