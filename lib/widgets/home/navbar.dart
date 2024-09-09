import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/models/products.dart';
import 'package:mool/screens/categories.dart';
import 'package:mool/screens/home.dart';
import 'package:mool/screens/my_list.dart';


class CustomNavbar extends ConsumerStatefulWidget {
  final int selectedIndex;
  const CustomNavbar({super.key, required this.selectedIndex});

  @override
  _CustomNavbarState createState() => _CustomNavbarState();
}

class _CustomNavbarState extends ConsumerState<CustomNavbar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HOmeScreen(),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.grid_view,
                  color: _selectedIndex == 1
                      ? const Color(0xFF33CCCC)
                      : Colors.white,
                ),
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Categories())),
              ),
              IconButton(
                  icon: Icon(
                    Icons.play_circle,
                    color: _selectedIndex == 2
                        ? const Color(0xFF33CCCC)
                        : Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MyListScreen(),
                        ),
                      )),
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
