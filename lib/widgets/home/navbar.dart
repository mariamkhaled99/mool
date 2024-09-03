import 'package:flutter/material.dart';
import 'package:mool/screens/categories.dart';
import 'package:mool/screens/home.dart';

class CustomNavbar extends StatefulWidget {
  final int selectedIndex;
  const CustomNavbar({super.key, required this.selectedIndex});

  @override
  _CustomNavbarState createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  late int _selectedIndex; // Define state variable

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex; // Initialize state with widget value
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update state
    });

    if (index == 0) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HOmeScreen()));
    } else if (index == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Categories()));
    } else if (index == 2) {
      // Handle navigation for index 2
    } else if (index == 3) {
      // Handle navigation for index 3
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(20),
      color: const Color.fromRGBO(41, 45, 50, 1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomAppBar(
          color: const Color.fromRGBO(41, 45, 50, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: _selectedIndex == 0
                      ? const Color(0xFF33CCCC)
                      : Colors.white,
                ),
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon: Icon(
                  Icons.grid_view,
                  color: _selectedIndex == 1
                      ? const Color(0xFF33CCCC)
                      : Colors.white,
                ),
                onPressed: () => _onItemTapped(1),
              ),
              IconButton(
                icon: Icon(
                  Icons.play_circle,
                  color: _selectedIndex == 2
                      ? const Color(0xFF33CCCC)
                      : Colors.white,
                ),
                onPressed: () => _onItemTapped(2),
              ),
              IconButton(
                icon: Icon(
                  Icons.shopping_bag,
                  color: _selectedIndex == 3
                      ? const Color(0xFF33CCCC)
                      : Colors.white,
                ),
                onPressed: () => _onItemTapped(3),
              ),
              IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: _selectedIndex == 4
                      ? const Color(0xFF33CCCC)
                      : Colors.white,
                ),
                onPressed: () => _onItemTapped(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
