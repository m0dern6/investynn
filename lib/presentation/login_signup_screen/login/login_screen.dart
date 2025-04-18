import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:investynn/core/config/dimensions/dimensions.dart';
import 'package:investynn/core/helper/custom_button.dart';
import 'package:investynn/core/helper/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.onPrimary),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions(context).width(10),
          vertical: Dimensions(context).height(20),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Login & Get Started',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 29,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Spacer(),
              ],
            ),
            Spacer(),
            Spacer(),
            Center(
              child: Text(
                'Welcome Back',
                style: Theme.of(
                  context,
                ).textTheme.displaySmall?.copyWith(fontSize: 23),
              ),
            ),
            SizedBox(height: Dimensions(context).height(40)),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Email',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            CustomTextField(
              hintText: 'Enter Email',
              controller: emailController,
            ),
            SizedBox(height: Dimensions(context).height(10)),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Password',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            CustomTextField(
              hintText: 'Enter Password',
              controller: passwordController,
              isPassword: true,
            ),
            SizedBox(height: Dimensions(context).height(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: Dimensions(context).width(19),
                      height: Dimensions(context).height(19),
                      child: Checkbox(
                        fillColor: WidgetStateProperty.all(
                          Theme.of(context).colorScheme.surface,
                        ),
                        splashRadius: 0,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        side: BorderSide.none,
                        value: false,
                        onChanged: (value) {},
                        activeColor: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                    SizedBox(width: Dimensions(context).width(5)),
                    Text(
                      'Remember me',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimensions(context).height(20)),
            PrimaryButton(
              text: 'Login',
              onPressed: () {
                context.go('/home');
              },
              isHighlighted: true,
            ),
            Spacer(),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        thickness: 1,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      'or',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        thickness: 1,
                        indent: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions(context).height(20)),
                SecondaryButton(text: 'Login with Google', onPressed: () {}),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                  ),
                  onPressed: () {
                    context.go('/register');
                  },
                  child: Text(
                    'Register',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary,
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
