import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shop/screens/auth/views/components/sign_up_form.dart';
import 'package:shop/route/route_constants.dart';

import '../../../constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/signUp_dark.png",
              height: MediaQuery.of(context).size.height * 0.55,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "¡Empecemos!",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  const Text(
                    "Por favor, ingresa tus datos válidos para crear una cuenta.",
                  ),
                  const SizedBox(height: defaultPadding),
                  SignUpForm(formKey: _formKey),
                  const SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      Checkbox(
                        onChanged: (value) {},
                        value: false,
                      ),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: "Estoy de acuerdo con los",
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, termsOfServicesScreenRoute);
                                  },
                                text: " Términos de servicio ",
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const TextSpan(
                                text: "y la política de privacidad.",
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  ElevatedButton(
                    onPressed: () {
                      // Hay 2 pantallas más mientras el usuario completa su perfil
                      // después de registrarse, está disponible en la versión pro consíguelo ahora
                      // 🔗 https://theflutterway.gumroad.com/l/fluttershop
                      Navigator.pushNamed(context, entryPointScreenRoute);
                    },
                    child: const Text("Continuar"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("¿Ya tienes una cuenta?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, logInScreenRoute);
                        },
                        child: const Text("Iniciar sesión"),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
