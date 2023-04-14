import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/auth_controller.dart';
import '../home_screen.dart';
import '../widgets/text_field_input.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
              ),
              const SizedBox(
                height: 50,
              ),
              TextFieldInput(
                hintText: 'Enter your e-mail',
                textEditingController: _emailController,
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 50,
              ),
              TextFieldInput(
                hintText: 'Enter your password',
                textEditingController: _passwordController,
                textInputType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 50,
              ),
              TextFieldInput(
                hintText: 'Enter your name',
                textEditingController: _userNameController,
                textInputType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 70,
              ),
              InkWell(
                onTap: () {
                  ref.read(authProvider).createUser(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return const HomeScreen();
                  }));
                },
                child: Container(
                  width: 250,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: Colors.blue,
                  ),
                  child: const Text(
                    'Enter',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
