import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracker/features/home/screens/home_screen.dart';
import '../services/firebase_auth_services.dart';
import '../widgets/form_container_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  bool _isSigning = false;

  final FirebaseAuthServices _auth = FirebaseAuthServices();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 27.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.h),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    FormContainerWidget(
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      nextFocusNode: _passwordFocusNode,
                      hintText: "Email",
                      isPasswordField: false,
                    ),
                    SizedBox(height: 10.h), // Responsive spacing
                    FormContainerWidget(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      hintText: "Password",
                      isPasswordField: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h), // Responsive spacing
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  if (_formKey.currentState?.validate() ?? false) {
                    _signIn();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'Please fix the errors in red before submitting.')),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 45.h, // Responsive height
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius:
                        BorderRadius.circular(10.r), // Responsive radius
                  ),
                  child: Center(
                    child: _isSigning
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp, // Responsive font size
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(height: 10.h), // Responsive spacing
              SizedBox(height: 20.h), // Responsive spacing
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed. Please try again.')),
      );
    }
  }
}
