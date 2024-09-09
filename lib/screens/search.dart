import 'package:flutter/material.dart';
import 'package:mool/screens/new_arrival.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> searchs = [
    'Zara Tops',
      'Zara Tops',
      'Zara Tops',
    
  ];

  // void _navigateToFilterPage(String filter) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => SpecificFilterPage(filterName: filter),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 237, 237),
      body: Stack(
        children: [
          Positioned(
            child: Container(
              height: 140,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF2A2E33),
                    Color(0xFF292D32),
                  ],
                  stops: [0.4427, 1.0],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "searchs",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 70,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: searchs.length,
                    itemBuilder: (context, index) {
                      final filter = searchs[index];
                      return Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                filter,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios),
                              // onTap: () => _navigateToFilterPage(filter),
                            ),
                            const Divider(), // Horizontal line
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
        padding: const EdgeInsets.all(16.0), // Adjust padding from the edges of the screen
        
          
          
            child: ElevatedButton(
              onPressed: () {
                 Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                   const NewArrivalScreen(products: []),
                            ),
                          );
              },
              child: const Text('Search'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.black, // Text color
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0), // Padding inside the button
                minimumSize: Size(200, 0), // Width of the button, height is auto
              ),
           
        ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



