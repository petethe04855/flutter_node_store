import 'package:flutter/material.dart';
import 'package:flutter_node_store/components/mobile_layout.dart';
import 'package:flutter_node_store/components/responsive_layout.dart';
import 'package:flutter_node_store/components/web_layout.dart';
import 'package:flutter_node_store/screens/register/register_Form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      webChild: WebLayout(
        imageWidget: Image.asset(
          'assets/images/signup.png',
          width: 100,
        ),
        dataWidget: RegisterForm(),
      ),
      mobileChild: MobileLayout(
        imageWidget: Image.asset(
          'assets/images/signup.png',
          width: 100,
        ),
        dataWidget: RegisterForm(),
      ),
    );
  }
}
