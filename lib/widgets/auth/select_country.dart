import 'package:flutter/material.dart';


// class CustomDropdown extends StatefulWidget {
//   final List<String> items;
//   final String? selectedValue;
//   final ValueChanged<String?> onChanged;

//   const CustomDropdown({
//     Key? key,
//     required this.items,
//     required this.selectedValue,
//     required this.onChanged,
//   }) : super(key: key);

//   @override
//   _CustomDropdownState createState() => _CustomDropdownState();
// }

// class _CustomDropdownState extends State<CustomDropdown> {
//   late String _selectedValue;
//   late List<String> _items;

//   @override
//   void initState() {
//     super.initState();
//     _selectedValue = widget.selectedValue ?? '';
//     _items = widget.items;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity, 
//       child: PopupMenuButton<String>(
//         onSelected: (value) {
//           setState(() {
//             _selectedValue = value;
//             widget.onChanged(_selectedValue);
//           });
//           Navigator.pop(context); // Close the dropdown when a value is selected
//         },
//         child: InputDecorator(
//           decoration: InputDecoration(
//             labelText: 'Country',
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//             ),
//           ),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   _selectedValue.isEmpty ? 'Select a country' : _selectedValue,
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//               Icon(Icons.arrow_drop_down, color: Colors.black),
//             ],
//           ),
//         ),
//         itemBuilder: (context) {
//           return _items.map((item) {
//             final isSelected = _selectedValue == item;
//             return PopupMenuItem<String>(
//               value: item,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Text(item),
//                   ),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: Checkbox(
//                       value: isSelected,
//                       onChanged: (value) {
                       
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }).toList()
//             ..add(
//               PopupMenuItem<String>(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Navigator.pop(context); // Close the dropdown
//                   },
//                   child: const Text('Continue'),
//                 ),
//               ),
//             );
//         },
//       ),
//     );
//   }
// }
