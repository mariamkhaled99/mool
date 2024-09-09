import 'package:flutter/material.dart';
import 'package:mool/screens/new_arrival.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final List<String> filters = [
    'Category',
    'Brand',
    'Size',
    'Color',
    'Product Rating',
    'Price',
  ];

  void _navigateToFilterPage(String filter) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SpecificFilterPage(filterName: filter),
      ),
    );
  }

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
                        "Filters",
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
                    itemCount: filters.length,
                    itemBuilder: (context, index) {
                      final filter = filters[index];
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
                              onTap: () => _navigateToFilterPage(filter),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                // Add your reset action here
              },
              child: const Text('Reset'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.white, // Text color
                side: BorderSide(color: Colors.black), // Border color
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0), // Padding inside the button
                minimumSize: Size(100, 0), // Width of the button, height is auto
              ),
            ),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                   const NewArrivalScreen(products: []),
                            ),
                          );
              },
              child: const Text('12 Apply'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.black, // Text color
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0), // Padding inside the button
                minimumSize: Size(200, 0), // Width of the button, height is auto
              ),
            ),
          ],
        ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}





class SpecificFilterPage extends StatefulWidget {
  final String filterName;

  const SpecificFilterPage({super.key, required this.filterName});

  @override
  _SpecificFilterPageState createState() => _SpecificFilterPageState();
}

class _SpecificFilterPageState extends State<SpecificFilterPage> {
  // Track selected options
  final Map<String, bool> _selectedOptions = {};

  @override
  void initState() {
    super.initState();
    // Initialize _selectedOptions based on filter options
    final filterOptions = _getFilterOptions(widget.filterName);
    for (var option in filterOptions) {
      _selectedOptions[option] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Define filter options based on filterName
    List<String> filterOptions = _getFilterOptions(widget.filterName);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 237, 237),
      body: Column(
        children: [
          Container(
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
                    Text(
                      widget.filterName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              itemCount: filterOptions.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 10, // Space between each divider
                child:  Divider(
                  color: Colors.black,
                  thickness: 1.0,
                ),
              ),
              itemBuilder: (context, index) {
                final option = filterOptions[index];
                final isSelected = _selectedOptions[option] ?? false;
                return Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(option, style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),),
                    trailing: Checkbox(
                      value: isSelected,
                      onChanged: (bool? value) {
                        setState(() {
                          _selectedOptions[option] = value ?? false;
                        });
                      },
                      checkColor: Colors.white, // Color of the check mark
                      activeColor: Colors.blue, // Color of the checkbox fill
                    ),
                    onTap: () {
                      setState(() {
                        _selectedOptions[option] = !_selectedOptions[option]!;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                   const FiltersScreen(),
                            ),
                          );
              },
              child: const Text('Apply'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // White text color
                backgroundColor: Colors.black, // Black background color
                padding: const EdgeInsets.symmetric(vertical: 15.0), // Add vertical padding
                minimumSize: Size(double.infinity, 0), // Full width
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> _getFilterOptions(String filterName) {
    // Define options for each filter
    switch (filterName) {
      case 'Category':
        return ['Tops', 'Bottoms', 'Dresses', 'New Arrival'];
      case 'Brand':
        return ['Zara', 'Mango', 'Only', 'H&M'];
      case 'Size':
        return ['XXL', 'XL', 'S', 'XS', 'M'];
      case 'Color':
        return ['Red', 'Blue', 'Green'];
      case 'Product Rating':
        return ['1 Star', '2 Stars', '3 Stars', '4 Stars', '5 Stars'];
      case 'Price':
        return ['Under \$50', '\$50 - \$100', 'Above \$100'];
      default:
        return [];
    }
  }
}
