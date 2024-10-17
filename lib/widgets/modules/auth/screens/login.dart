import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../kernel/widgets/custom_text_field_password.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? validateEmail(String? value) {
  final RegExp emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  if (value == null || value.isEmpty) {
    return 'Por favor, ingrese su correo electrónico';
  } else if (!emailRegExp.hasMatch(value)) {
    return 'Por favor, ingrese un correo electrónico válido';
  }
  return null;
  }
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'La contraseña es requerida';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar sesión'),
        backgroundColor: Colors.grey[200],
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 16,
        ),
      ),
      body: Center(child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png', width: 200, height: 200,),
              TextFormField(
                validator: validateEmail,
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Correo electrónico',
                  label: Text('Correo electrónico')
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16,),
              TextFieldPassword(
                controller: _passwordController
              ),
              const SizedBox(height: 16,),
              SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if(_formKey.currentState!.validate()) {
                      try {
                        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text
                        );
                        print('Credential: $credential');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      }                                            
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.grey[850],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                    )
                  ),
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(height: 8,),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/register'),
                child: const Text('Registrarse', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
              )
            ],
          ),
        ),
      ),),
    );
  }
}
