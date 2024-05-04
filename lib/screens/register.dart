import 'dart:async';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class PasswordValidator extends TextFieldValidator{
  PasswordValidator({String errorText = 'Invalid password'})
     : super(errorText);

     @override
     bool isValid(String? value) {
      if (value == null || value.isEmpty) {
        return false;
      }
      return value.length >=8;
     }
}

class PhoneNumberValidator extends TextFieldValidator {
  PhoneNumberValidator({String errorText = 'Invalid phone number'})
  : super(errorText);

  @override
  bool isValid(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    return value.length == 10;
    }
  }


class _RegisterState extends State<Register> {
final _formKey = GlobalKey<FormState>();
   final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  Future<void>_register() async{
    if(_formKey.currentState!.validate()){
      try{
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        await addUserData(_firstNameController.text, _lastNameController.text, _emailController.text, _passwordController.text, _mobileController.text);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration is Successful'),
            backgroundColor: Colors.green,
          ),
          );
      }
    catch (e) {
      print('Registration failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration failed: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/image2.jpg'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: _firstNameController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter first Name'),
                      MinLengthValidator(
                        3,
                        errorText: 'Minimum 3 characters required',
                      ),
                    ]).call,
                    decoration: const InputDecoration(
                      hintText: 'Enter First Name',
                      labelText: 'First Name',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.green,
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _lastNameController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter last name'),
                      MinLengthValidator(3,
                      errorText:
                          'Last name should be atleast 3 characters'),
                    ]).call,
                    decoration: const InputDecoration(
                      hintText: 'Enter last name',
                      labelText: 'Last Name',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 13, 91, 127),
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius:
                         BorderRadius.all(Radius.circular(9.0))
                      ),
                    ),
                  ),
                ),

                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _emailController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter email address'),
                      EmailValidator(
                      errorText:
                          'Please enter correct email filled'),
                    ]).call,
                    decoration: const InputDecoration(
                      hintText: 'Email Address',
                      labelText: 'Email',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 13, 91, 127),
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius:
                         BorderRadius.all(Radius.circular(9.0))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter email password'),
                      PasswordValidator(errorText: 'Password must be at least 8 characters long'),
                    ]).call,
                    decoration: const InputDecoration(
                      hintText: 'Enter Email Password',
                      labelText: 'Email Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color.fromARGB(255, 13, 91, 127),
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius:
                        BorderRadius.all(Radius.circular(9.0))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _mobileController,
                    validator: PhoneNumberValidator(errorText: 'Enter a valid phone number').call,
                    decoration: const InputDecoration(
                      hintText: 'Enter phone number',
                      labelText: 'Phone Number',
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Color.fromARGB(255, 16, 101, 237),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius:
                        BorderRadius.all(Radius.circular(9.0))
                      ),
                      ),
                    ),
                  ), 

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                            String firstName = _firstNameController.text;
                            String lastName = _lastNameController.text;
                            String email = _emailController.text;
                            String password= _passwordController.text;
                            String mobile = _mobileController.text;

                            addUserData(firstName, lastName, email, password, mobile);
                            }
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> addUserData(String firstName, String lastName, String email, String password, String mobile) async {
  try {
    CollectionReference users= FirebaseFirestore.instance.collection('users');
    await users.add({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'mobile': mobile,
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Registration Successful"),
        backgroundColor: Colors.green,
      ),
    );
  } 
  on FirebaseAuthException 
  catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Registration failed: ${e.message}"),
        backgroundColor: Colors.red,
      ),
    );
  }
}  
}
