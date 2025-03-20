import 'package:flutter/material.dart';
import 'sign_up_page.dart'; // Import the SignUpPage

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Validate form input
  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username cannot be empty';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    return null;
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      // Perform the login action (e.g., authentication)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logging in...')),
      );
      // Proceed with login logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: validateUsername,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  validator: validatePassword,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submit,
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    // Navigate to SignUpPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text('Don\'t have an account? Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
