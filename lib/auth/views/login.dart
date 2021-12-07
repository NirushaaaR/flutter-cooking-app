import 'package:cooking_app/auth/views/register.dart';
import 'package:cooking_app/recipe/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cooking_app/auth/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          top: 40,
        ),
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: const Text(
                "Welcome to cooking app",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              child: Text(
                "You need to login to use the app",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
            const CustomTextField(
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              hintText: 'Email Or Username',
            ),
            const CustomTextField(
              padding: EdgeInsets.only(
                top: 5,
                bottom: 1,
              ),
              hintText: 'Password',
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    print("forget password");
                  },
                  child: const Text('Forget your password ?'),
                )
              ],
            ),
            ConfirmButton(
              text: 'Login',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 12,
              ),
              child: Row(
                children: const [
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Divider(
                      height: 10,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text('Or continue with'),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Divider(
                      height: 10,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 32,
                    onPressed: () {
                      print("login google");
                    },
                    icon: const Icon(FontAwesomeIcons.googlePlusG),
                    color: Colors.red,
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  IconButton(
                    iconSize: 32,
                    onPressed: () {
                      print("login facebook");
                    },
                    icon: const Icon(FontAwesomeIcons.facebook),
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Not a member ?  "),
                InkWell(
                  child: const Text(
                    'Register Now.',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
