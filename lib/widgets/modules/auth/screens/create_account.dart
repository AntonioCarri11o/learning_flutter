import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/kernel/widgets/custom_text_field_password.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear cuenta'),
        backgroundColor: Colors.grey[850],
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', height: 200, width: 200,),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'example@email.com',
                          labelText: 'Correo electrónico',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                      ),
                      TextFieldPassword(controller: _passwordController),
                      const SizedBox(height: 16,),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(onPressed: () async {
                          try {
                            final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
                        },
                          child: const Text('Crear cuenta')
                        ),
                      )

                    ],
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}