import 'package:flutter/material.dart';
import 'package:cooking_app/auth/widgets/widgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5AC086),
        title: Text('Register'),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          top: 40,
        ),
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              child: const Text(
                "Register",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                ),
              ),
            ),
            const CustomTextField(
              hintText: 'Username',
            ),
            const CustomTextField(
              hintText: 'Password',
            ),
            const CustomTextField(
              hintText: 'Email',
            ),
            ConfirmButton(
              text: 'Register',
              onPressed: () {
                print('register');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already a member ?  "),
                InkWell(
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
