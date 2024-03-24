import 'package:flutter/material.dart';
import 'package:m_boote/data/commercial_address_data.dart';
import 'package:m_boote/third_page/boat_data_widget.dart';
import 'package:m_boote/third_page/image_container_widget.dart';
import 'package:m_boote/third_page/name_and_price.dart';
import 'package:m_boote/widgets/text_field.dart';


class AdvertisementItemWidget extends StatelessWidget {
  final String advertisement;
  final void Function() onTap;
  final bool isCommercial; // Hinzugefügter Parameter
  final CommercialAddressData? commercialAddressData;

  const AdvertisementItemWidget({
    super.key, // Hinzugefügter Parameter
    required this.advertisement,
    required this.onTap,
    required this.isCommercial,
    this.commercialAddressData,
  }); // Hinzugefügter Aufruf des Superkonstruktors

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const ImageContainerWidget(),
                  const SizedBox(width: 10), // Verwendet ein SizedBox mit const
                  NameAndPrice(
                      isCommercial:
                          isCommercial), // Verwendet den übergebenen Wert von isCommercial
                ],
              ),
              const SizedBox(height: 10), // Verwendet ein SizedBox mit const
              const TextFieldWidget(),
              const SizedBox(height: 10), // Verwendet ein SizedBox mit const
              if (commercialAddressData != null)
                Text('Commercial Address: $commercialAddressData'),
              const BoatDataWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
