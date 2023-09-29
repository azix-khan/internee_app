import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internee_pk/Utils/round_button.dart';
import 'package:internee_pk/Utils/toast_message_utils.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'images/logo.png',
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Enter your email:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                fillColor: const Color(0xffF7F8F9),
                filled: false,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundButton(
              title: 'Send OTP',
              loading: loading,
              onTap: () {
                setState(() {
                  loading = true;
                });
                auth
                    .sendPasswordResetEmail(
                        email: emailController.text.toString())
                    .then(
                  (value) {
                    setState(() {
                      loading = false;
                    });
                    Utils().toastMessage(
                      'We have sent you email to recover password, please check your email',
                    );
                  },
                ).onError(
                  (error, stackTrace) {
                    setState(() {
                      loading = false;
                    });
                    Utils().toastMessage(
                      error.toString(),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
