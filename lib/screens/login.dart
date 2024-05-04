import 'package:flutter/material.dart';
import 'package:rent_and_buy/screens/home_page.dart';
import 'package:rent_and_buy/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text(
        'Welcome to RentandBuy!',
        style: TextStyle(fontSize: 34),
      ),  
      centerTitle: true,
      backgroundColor: const Color.fromARGB(249, 134, 216, 253),
      ),
      body:  Center(

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                const SizedBox(height: 15),
                      TextField(
                        controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter Email',
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      ),
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.blue,
                      ),
                    ),
                ),
              const SizedBox(height: 15),
                     TextField(
                      controller: passwordController,
                      obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),

                    prefixIcon: const Icon(
                      Icons.key_rounded,
                       color: Colors.blue,
                      ),
                  ),
                ),
                const SizedBox(height: 5),
                FloatingActionButton(
                  onPressed: () async {
                    try {
                      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const HomePage(),
                      ),
                    );
                  }
                  catch (e) { 
                    print ('Login failed: $e');
                  }
                  },
                  backgroundColor:  const Color.fromARGB(249, 134, 216, 253),
                  child: const Text('Login'), 
                  
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const Register(),
                      ),
                    );
                  },
                  
                  child: RichText(
                    text: const TextSpan(
                      
                      text: 'Don\'t have an account?',
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Register',
                          style: TextStyle(
                            color: Color.fromARGB(255, 1, 22, 39),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                ),
                  
                ],
              ),
            ),
            const Image(
              image:AssetImage('assets/images/image1.jpg'),
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
          ]
        )
      )
     
    );
  }
}