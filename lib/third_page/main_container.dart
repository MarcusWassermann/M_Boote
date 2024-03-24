import 'package:flutter/material.dart';

class MainContainerWidget extends StatefulWidget {
  const MainContainerWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainContainerWidgetState createState() => _MainContainerWidgetState();
}

class _MainContainerWidgetState extends State<MainContainerWidget> {
  bool isFavorite = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(200, 234, 233, 228),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Bildcontainer (kann entfernt werden)
            // ImageContainerWidget(
            //   onAnbieterPressed: () {
            //     // Aktion bei Anbieter-Button
            //   },
            //   imageUrls: ['url1', 'url2', 'url3'],
            // ),
            // Restliche Inhalte des Containers
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Text(
                        //   providerType,
                        //   style: const TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 18,
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : null,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Weitere Inhalte
                    // ...
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
