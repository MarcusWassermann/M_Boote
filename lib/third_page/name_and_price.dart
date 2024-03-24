import 'package:flutter/material.dart';
import 'package:m_boote/contactform_page/contactformscreen.dart';
import 'package:m_boote/fourth_page/fourth_screen.dart';


class NameAndPrice extends StatefulWidget {
  final bool isCommercial;

  const NameAndPrice({super.key, required this.isCommercial});

  @override
  // ignore: library_private_types_in_public_api
  _NameAndPriceState createState() => _NameAndPriceState();
}

class _NameAndPriceState extends State<NameAndPrice> {
  bool isCommercial = false;
  bool isPrivate = false;

  double commercialAlignment = 0.0;
  double privateAlignment = 0.0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment(-1.0, commercialAlignment),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gew. Anbieter',
                  style: TextStyle(
                      fontSize: 12,
                      color: widget.isCommercial ? Colors.blue : Colors.black),
                ),
                IconButton(
                  onPressed: widget.isCommercial
                      ? null
                      : () {
                          setState(() {
                            isCommercial = true;
                            isPrivate = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FourthScreen(),
                            ),
                          );
                        },
                  icon: const Icon(Icons.fingerprint_rounded),
                  color: widget.isCommercial ? Colors.blue : Colors.black,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(-1.0, privateAlignment),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Privat',
                  style: TextStyle(
                      fontSize: 12,
                      color: widget.isCommercial ? Colors.black : Colors.blue),
                ),
                IconButton(
                  onPressed: widget.isCommercial
                      ? () {
                          setState(() {
                            isCommercial = false;
                            isPrivate = true;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ContactFormScreen(),
                            ),
                          );
                        }
                      : null,
                  icon: const Icon(Icons.fingerprint_rounded),
                  color: widget.isCommercial ? Colors.black : Colors.blue,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              'Name',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              'Price',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
