import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _oldPassword = '';
  String _newPassword = '';
  String _confirmPassword = '';

  // Define FocusNodes
  final FocusNode _oldPasswordFocusNode = FocusNode();
  final FocusNode _newPasswordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _oldPasswordFocusNode.dispose();
    _newPasswordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
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
        title: const Text('Change Password',
            style: TextStyle(color: Colors.white)),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard on tap outside
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 60),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Old Password',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                           color: Color.fromARGB(255, 102, 100, 100),
                        fontSize: 18.0,
                      ),
                    ),
                    _buildPasswordField(
                        'Old Password',
                        (value) => _oldPassword = value!,
                        _oldPasswordFocusNode,
                        _newPasswordFocusNode),
                    const SizedBox(height: 16.0),
                    const Text(
                      'New Password',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromARGB(255, 102, 100, 100),
                        fontSize: 18.0,
                      ),
                    ),
                    _buildPasswordField(
                        'New Password',
                        (value) => _newPassword = value!,
                        _newPasswordFocusNode,
                        _confirmPasswordFocusNode),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Confirm Password',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromARGB(255, 102, 100, 100),
                        fontSize: 18.0,
                      ),
                    ),
                    _buildPasswordField(
                        'Confirm Password',
                        (value) => _confirmPassword = value!,
                        _confirmPasswordFocusNode,
                        null),
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
                child: const Text('Update Password',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField(
    String label,
    FormFieldSetter<String> onSaved,
    FocusNode? focusNode,
    FocusNode? nextFocusNode,
  ) {
    return TextFormField(
     
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
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
      
        return null;
      },
      onSaved: onSaved,
      textInputAction: nextFocusNode != null ? TextInputAction.next : TextInputAction.done,
      onFieldSubmitted: (value) {
        if (nextFocusNode != null) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
    );
  }

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
     
      bool passwordChangedSuccessfully =
          true; // Change this based on actual success

      if (passwordChangedSuccessfully) {
        final snackBar = SnackBar(
          content:  Text(
            'Password changed successfully!',
            style: TextStyle(color: Colors.white), // Text color
          ),
          backgroundColor: Colors.black, // Background color
          behavior: SnackBarBehavior.floating,
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        // Wait for the SnackBar to be dismissed
        await Future.delayed(const Duration(seconds: 3));

        // Navigate back after the SnackBar is dismissed
        Navigator.pop(context);
      }
    }
  }
}
