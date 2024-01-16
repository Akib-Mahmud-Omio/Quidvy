import 'package:flutter/material.dart';
import 'package:quidvy/pages/bottomnavigationbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Bottom()),
      );
    } on FirebaseAuthException catch (e) {
      print("Error: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quidvy'),
      ),
      backgroundColor: Colors.orange,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _signInWithEmailAndPassword(context),

              child: Text('Log in'),
            ),
            SizedBox(height: 12.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 12.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                );
              },
              child: Text('Forgot Password'),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  Future<void> _signUpWithEmailAndPassword(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'email': emailController.text,
        'phoneNumber': phoneNumberController.text,
        'currentBalance': 0.0,
        'income': 0.0,
        'expenses': 0.0,
      });

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print("Error: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quidvy - Sign Up'),
      ),
      backgroundColor: Colors.orange,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                hintText: 'Phone Number',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _signUpWithEmailAndPassword(context),
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}



class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quidvy - Forgot Password'),
      ),
      backgroundColor: Colors.orange,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Phone Number',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {

              },
              child: Text('Recover Password'),
            ),
          ],
        ),
      ),
    );
  }
}