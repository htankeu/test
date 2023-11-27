import 'package:bookmytime/services/auth_services.dart';
import 'package:bookmytime/tools/pallete.dart';
import 'package:bookmytime/widgets/gradient_button.dart';
import 'package:bookmytime/widgets/input_field.dart';
import 'package:bookmytime/widgets/linkText.dart';
import 'package:bookmytime/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingUpScreen extends StatefulWidget {
  final void Function()? onClick;
  const SingUpScreen({
    Key? key,
    this.onClick,
  }) : super(key: key);

  @override
  State<SingUpScreen> createState() => _registerPageState();
}

class _registerPageState extends State<SingUpScreen> {
  // text controllers
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

// singUp User
  void signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match!"),
        ),
      );
      return;
    }

    // get auth service
    final authService = Provider.of<AuthServices>(context, listen: false);

    try {
      await authService.signUpWithEmailandPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Center(
          child: Column(children: [
            Image.asset(
              'assets/images/logo.png',
              height: 90,
            ),
            const Text(
              'Sing Up',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Pallete.blackColor),
            ),
            const SizedBox(
              height: 25,
            ),
            SocialButton(
              iconPath: 'assets/svgs/icons8-google.svg',
              label: 'Continue with Google',
              onPressed: () {},
            ),
            const SizedBox(
              height: 15,
            ),
            SocialButton(
              iconPath: 'assets/svgs/icons8-facebook.svg',
              label: 'Continue with Facebook',
              horizontalPadding: 93,
              onPressed: () {},
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'or',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InputField(
              textController: usernameController,
              hinText: 'Username',
              hintextColor: Pallete.blackColorfloat,
              iconName: Icons.people_alt,
            ),
            const SizedBox(
              height: 15,
            ),
            InputField(
              textController: emailController,
              hinText: 'Email',
              hintextColor: Pallete.blackColorfloat,
              iconName: Icons.mail_rounded,
            ),
            const SizedBox(
              height: 15,
            ),
            InputField(
              textController: passwordController,
              hinText: 'Password',
              hintextColor: Pallete.blackColorfloat,
              iconName: Icons.lock,
              obscureText: true,
            ),
            const SizedBox(
              height: 15,
            ),
            InputField(
              textController: confirmPasswordController,
              hinText: 'Confirm password',
              hintextColor: Pallete.blackColorfloat,
              iconName: Icons.password,
              suffixIconName: Icons.remove_red_eye_sharp,
              obscureText: true,
            ),
            const SizedBox(
              height: 15,
            ),
            GradientButton(
              text: 'Sing Up',
              buttonWidth: 240,
              buttonHeight: 60,
              action: signUp,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8, right: 5),
                  child: Text(
                    "Already have a Account?",
                    style: TextStyle(color: Pallete.blackColor),
                  ),
                ),
                GestureDetector(
                  onTap: widget.onClick ,
                  child: const LinkText(outputText: 'Sing in here!'),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            )
          ]),
        )),
      ),
    );
  }
}
