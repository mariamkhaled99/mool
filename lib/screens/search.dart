import 'package:flutter/material.dart';
import 'package:mool/screens/home.dart';

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

  final List<String> suggestions = [
    'Zara Tops',
    'Zara Bottoms',
    'Only Tops',
  ];

  final TextEditingController _searchController = TextEditingController();
  bool _showSuggestions = false;
  List<String> _filteredSuggestions = [];

  void _onSearchChanged(String query) {
    setState(() {
      _filteredSuggestions = suggestions
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
      _showSuggestions = _filteredSuggestions.isNotEmpty;
    });
  }

  void _onSearchSubmitted(String query) {
    FocusScope.of(context).unfocus();  // Hide the keyboard when search is submitted
    print("Search for: $query");
    // Handle search logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 229, 229), // Light background
      appBar: AppBar(
        backgroundColor: const Color(0xFF292D32),
        toolbarHeight: 60.0,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/images/logo2.png',
            width: 70,
            height: 60,
          ),
          onPressed: () {
            FocusScope.of(context).unfocus(); // Hide the keyboard when navigating
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HOmeScreen(),
              ),
            );
          },
        ),
        title: Column(
          children: [
             SizedBox(height: 20,),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.96, // Adjust width as needed
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      icon: Image.asset(
                        'assets/images/search-normal.png',
                        color: Colors.white,
                        width: 30,
                        height: 30,
                      ),
                      onPressed: () {
                        // Optionally, perform search or handle the icon click
                      },
                    ),
                    hintText: 'What are you looking for?',
                    hintStyle: const TextStyle(color: Colors.white70,fontSize: 14),
                    filled: true,
                    fillColor: const Color.fromRGBO(97, 97, 97, 1.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0), 
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 5), // Smaller height
                  ),
                  style: const TextStyle(color: Colors.white),
                  onChanged: _onSearchChanged,
                  onSubmitted: _onSearchSubmitted,
                ),
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_showSuggestions)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _filteredSuggestions.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              _filteredSuggestions[index],
                              style: const TextStyle(color: Colors.black),
                            ),
                            onTap: () {
                              setState(() {
                                _searchController.text =
                                    _filteredSuggestions[index];
                                _showSuggestions = false;
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Top Searches',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: const Text(
                          'Zara',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: const Text(
                          'Only',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: const Text(
                          'Mango',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Recent Searches',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: searchs.length,
                    itemBuilder: (context, index) {
                      final filter = searchs[index];
                      return Container(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                filter,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios,
                                  color: Colors.grey),
                            ),
                            const Divider(
                              color: Colors.grey, // Horizontal line
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: ElevatedButton.icon(
              onPressed: () {
                FocusScope.of(context).unfocus(); // Hide the keyboard before searching
                _onSearchSubmitted(_searchController.text);
              },
              icon: const Icon(Icons.search),
              label: const Text('Search'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 48.0,
                  vertical: 12.0,
                ),
                minimumSize:
                    const Size(double.infinity, 48), // Full-width button
              ),
            ),
          ),
        ],
      ),
    );
  }
}
