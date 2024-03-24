import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ImageUploadWidget extends StatelessWidget {
  const ImageUploadWidget({super.key});

  // Funktion zum Hochladen der Bilder implementieren
  void _uploadImages(BuildContext context) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final ImagePicker _picker = ImagePicker(); // ImagePicker-Instanz erstellen
    final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery); // Bild aus der Galerie auswählen

    // Logik zur Verarbeitung des ausgewählten Bildes hier implementieren
    if (image != null) {
      // Hier könnte man das ausgewählte Bild weiterverarbeiten, z.B. anzeigen oder hochladen
      // Beispiel: Navigator.push(context, MaterialPageRoute(builder: (context) => ImageDisplayScreen(imagePath: image.path)));
    } else {
      // Behandlung, wenn kein Bild ausgewählt wurde
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kein Bild ausgewählt')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2.0),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Bilder hochladen:',
            style: TextStyle(fontSize: 12.0),
          ),
          ElevatedButton(
            onPressed: () {
              _uploadImages(
                  context); // Funktion zum Hochladen der Bilder aufrufen
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.cloud_upload),
                SizedBox(width: 8.0),
                Text('Bilder hochladen'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
