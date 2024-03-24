import 'package:flutter/material.dart';
import 'package:m_boote/third_page/advertisement_item.dart';
import 'package:m_boote/third_page/info_card.dart';
import 'package:m_boote/widgets/custom_navigations_bar.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key, required this.category});

  final String category;

  @override
  // ignore: library_private_types_in_public_api
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final Color boxColor = const Color.fromARGB(255, 237, 238, 228);

  final List<String> topBoxContents = [
    'Marke',
    'Modell',
    'Auswahl',
    'Liegeplatz',
    'Baujahr von',
    'Baujahr bis',
    'Länge min',
    'Länge max',
    'Preis von',
    'Preis bis',
    'Motorart',
    'Kraftstoff',
    'Leistung von',
    'Segel Anzahl',
    'Segel qm',
  ];

  List<String> advertisements = [];
  int currentPage = 0;
  int itemsPerPage = 10;

  @override
  void initState() {
    super.initState();
    advertisements = List.generate(3000, (index) => 'Anzeige ${index + 1}');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 150, 243),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        toolbarHeight: 80,
        centerTitle: true,
        title: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Image.asset('assets/logo-transparent-png.png'),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: topBoxContents.map((content) {
                return InfoCard(
                  content: content,
                  boxColor: boxColor,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(''),
                          content: Text(content),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Filter anwenden'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  onFilterApply: () {
                    // Implementieren Sie die Filteranwendung
                  },
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: FutureBuilder<List<String>>(
              future: _fetchAdvertisements(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<String> advertisements = snapshot.data!;
                  return ListView.builder(
                    itemCount: advertisements.length,
                    itemBuilder: (context, index) {
                      String advertisement = advertisements[index];
                      return AdvertisementItemWidget(
                        advertisement: advertisement,
                        onTap: () {},
                        isCommercial: false,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: 0,
        onItemTapped: (index) {},
      ),
    );
  }

  Future<List<String>> _fetchAdvertisements() async {
    await Future.delayed(const Duration(seconds: 1));
    return advertisements
        .skip(currentPage * itemsPerPage)
        .take(itemsPerPage)
        .toList();
  }
}
