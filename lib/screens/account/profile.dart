import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mool/utils/otp_utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  int _start = 59; // Initial countdown value
  Timer? _timer;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _phone = '';
  String _dateOfBirth = '';
  String _password = '';
  bool _isVerified = false;

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _dateOfBirthFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _dateOfBirthFocusNode.dispose();
    _passwordFocusNode.dispose();
    _timer?.cancel();
    super.dispose();
  }

void _startCountdown() {
  _timer?.cancel(); 
  _start = 59; 

  // Start the countdown timer
  _timer = Timer.periodic(Duration(seconds: 1), (timer) {
    if (_start >= 0) {
      _start--;
      // Use setState inside StatefulBuilder to update the dialog content
      if (context != null) {
        (context as Element).markNeedsBuild();
      }
    } else {
      _timer?.cancel(); // Stop the timer when it reaches 0
    }
  });
}

  void _showVerificationDialog() {
  _startCountdown();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
         
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 213, 212, 212),
            contentPadding: const EdgeInsets.all(20), // Added padding to the dialog
            content: SizedBox(
              width: double.maxFinite, // Ensure dialog takes full width
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Adjusts the column size to fit its content
                  children: [
                    Image.asset(
                      'assets/images/otp.png',
                      fit: BoxFit.contain,
                      height: 80, // Adjust height as needed
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Enter 4-digit code sent to',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      '+961518745363',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 45,
                          height: 40,
                          child: OtpField(), // Adjust width
                        ),
                        SizedBox(
                          width: 45,
                          height: 40,
                          child: OtpField(), // Adjust width
                        ),
                        SizedBox(
                          width: 45,
                          height: 40,
                          child: OtpField(), // Adjust width
                        ),
                        SizedBox(
                          width: 45,
                          height: 40,
                          child: OtpField(), // Adjust width
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  
                    Text(
                      "Resend code in 00:${_start.toString().padLeft(2, '0')}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Indicate verification success
                        setState(() {
                          _isVerified = true;
                        });
                        Navigator.of(context).pop();
                        // Optionally show a success snackbar or dialog
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 12, // Adjust padding
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          );
        },
      );
    },
  ).then((_) {
    _timer?.cancel(); // Cancel the timer when the dialog is closed
  });
}

  void _deleteProfile() {
    // Simulate profile deletion logic here

    final snackBar = SnackBar(
      content: const Text(
        'Profile deleted successfully!',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 237, 237),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:
            const Text('Your Account', style: TextStyle(color: Colors.white)),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30,),
                    const Text(
                      'Name',
                      style: TextStyle(
                        color: Color.fromARGB(255, 102, 100, 100),
                        fontSize: 18.0,
                      ),
                    ),
                    _buildTextField(
                      'Name',
                      (value) => _name = value!,
                      _nameFocusNode,
                      _emailFocusNode,
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Email',
                      style: TextStyle(
                        color: Color.fromARGB(255, 102, 100, 100),
                        fontSize: 18.0,
                      ),
                    ),
                    _buildTextField(
                      'Email',
                      (value) => _email = value!,
                      _emailFocusNode,
                      _phoneFocusNode,
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Phone',
                      style: TextStyle(
                        color: Color.fromARGB(255, 102, 100, 100),
                        fontSize: 18.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: _buildTextField(
                            'Phone',
                            (value) => _phone = value!,
                            _phoneFocusNode,
                            _dateOfBirthFocusNode,
                            // suffixText:
                            //     _isVerified ? 'Verified' : 'Not Verified',
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                            ),
                            border: Border(
                              right: BorderSide(
                                color: Colors.white,
                                width: 15.0,
                              ),
                            ),
                          ),
                          child: TextButton(
                            onPressed: _showVerificationDialog,
                            child: Text(
                              _isVerified ? 'Verified' : 'Not Verified',
                              style: TextStyle(
                                  color:
                                      _isVerified ? Colors.green : Colors.red),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Date of Birth',
                      style: TextStyle(
                        color: Color.fromARGB(255, 102, 100, 100),
                        fontSize: 18.0,
                      ),
                    ),
                    _buildDatePickerField(
                      'Date of Birth',
                      (value) => _dateOfBirth = value!,
                      _dateOfBirthFocusNode,
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Password',
                      style: TextStyle(
                          color: Color.fromARGB(255, 102, 100, 100),
                        fontSize: 18.0,
                      ),
                    ),
                    _buildPasswordField(
                      'Password',
                      (value) => _password = value!,
                      _passwordFocusNode,
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text('Update profile',
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _deleteProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  side: BorderSide(color: Colors.black, width: 2.0),
                  elevation: 0,
                ),
                child: const Text(
                  'Delete profile',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    FormFieldSetter<String> onSaved,
    FocusNode? focusNode,
    FocusNode? nextFocusNode, {
    String? suffixText,
  }) {
    return TextFormField(
      focusNode: focusNode,
      decoration: InputDecoration(
        // labelText: label,
        // suffixText: suffixText,
        // suffixStyle: TextStyle(
        //   color: suffixText == 'Verified' ? Colors.green : Colors.red,
        //   fontWeight: FontWeight.bold,
        // ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 51, 204, 204)),
        ),
      ),
      validator: (value) {
        // if (value == null || value.isEmpty) {
        //   return 'Please enter your $label';
        // }
        return null;
      },
      onSaved: onSaved,
      textInputAction:
          nextFocusNode != null ? TextInputAction.next : TextInputAction.done,
      onFieldSubmitted: (value) {
        if (nextFocusNode != null) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
    );
  }

 Widget _buildDatePickerField(
  String label,
  FormFieldSetter<String> onSaved,
  FocusNode? focusNode,
) {
  return TextFormField(
    focusNode: focusNode,
    readOnly: true,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.all(12.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Color.fromARGB(255, 51, 204, 204)),
      ),
      suffixIcon: Icon(Icons.calendar_today, color: Colors.grey), // Add a calendar icon
    ),
    onTap: () async {
      FocusScope.of(context).requestFocus(FocusNode());
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (pickedDate != null) {
        final String formattedDate = "${pickedDate.toLocal()}".split(' ')[0];
        setState(() {
          _dateOfBirth = formattedDate;
        });
        onSaved(formattedDate);
      }
    },
    controller: TextEditingController(text: _dateOfBirth),
  );
}

  Widget _buildPasswordField(
      String label, FormFieldSetter<String> onSaved, FocusNode? focusNode) {
    return TextFormField(
      focusNode: focusNode,
      obscureText: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 51, 204, 204)),
        ),
      ),
      validator: (value) {
        // if (value == null || value.isEmpty) {
        //   return 'Please enter your $label';
        // }
        return null;
      },
      onSaved: onSaved,
    );
  }

  void _submitForm() async {
    final snackBar = SnackBar(
      content: const Text(
        'Profile Updated successfully!',
        style: TextStyle(color: Colors.white), // Text color
      ),
      backgroundColor: Colors.black, // Background color
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // Wait for the SnackBar to be dismissed
    await Future.delayed(const Duration(seconds: 4));

    // Navigate back after the SnackBar is dismissed
    Navigator.pop(context);
  }
}
