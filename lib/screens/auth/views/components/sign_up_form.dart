import 'package:flutter/material.dart';


class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: usernameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Por favor, ingresa un nombre de usuario";
              }
              return null;
            },
            decoration: const InputDecoration(hintText: "Nombre de usuario"),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Por favor, ingresa tu correo electrónico";
              }
              return null;
            },
            decoration: const InputDecoration(hintText: "Correo electrónico"),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Por favor, ingresa tu contraseña";
              }
              return null;
            },
            obscureText: true,
            decoration: const InputDecoration(hintText: "Contraseña"),
          ),
        ],
      ),
    );
  }
}
