import 'package:flutter/material.dart';
import 'package:login_page/pages/home_page.dart';
import 'package:login_page/pocketbase/pb.dart';
import 'package:login_page/widgets/login_page_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Login Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginTextField(
                obscureText: false, hintText: 'Email', controller: emailCtr),
            LoginTextField(
                obscureText: true,
                hintText: 'Password',
                controller: passwordCtr),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(380),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  backgroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                ),
                onPressed: _signIn,
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _signIn() async {
    if (emailCtr.text.isEmpty || passwordCtr.text.isEmpty) {
      const snackBar = SnackBar(
        backgroundColor: Colors.grey,
        content: Text(
          'Please fill all the fields',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    try {
      final authData = await PocketBaseService()
          .pb
          .collection('users')
          .authWithPassword(emailCtr.text, passwordCtr.text);

      if (!mounted) return;

      if (authData.record != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        const snackBar = SnackBar(
          content: Text('Data is not available'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      if (e.toString().contains('Failed to authenticate')) {
        const snackBar = SnackBar(
            backgroundColor: Colors.grey,
            content: Text(
              'Incorrect email or password',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}
