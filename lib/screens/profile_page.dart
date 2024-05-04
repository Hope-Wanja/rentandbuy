import 'package:flutter/material.dart';
import 'package:rent_and_buy/screens/edit_profile.dart';
import 'package:rent_and_buy/screens/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}    

class _ProfilePageState extends State<ProfilePage> {
  late User? _user;
  late String _userName ='';
  late String _userEmail ='';

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
    
  }

  Future<void> _checkAuthentication() async {
    _user = FirebaseAuth.instance.currentUser;
    if (_user  == null) {
      
      Navigator.pushReplacementNamed(context, '/login');
  }
  else {
    _loadUserData();
  }
  }
 
    Future<void> _loadUserData() async {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
      .collection('users')
      .doc(_user!.uid)
      .get();
     if (userDoc.exists) {
      setState(() {
        _userName = userDoc['firstName'] ?? '';
        _userEmail = userDoc['email'] ?? '';
      }
      );
     } 
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children:[
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(image: AssetImage('assets/images/image13.jpg'))),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),
                      color: Colors.lightBlue
                      ),
                      child: const Icon(
                        Icons.account_circle_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(_userName,
               style: Theme.of(context).textTheme.titleLarge
               ),
              Text(_userEmail,
               style: Theme.of(context).textTheme.bodyMedium
               ),
              const SizedBox(height: 20),

              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const EditProfilePage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue, side: BorderSide.none, shape: const StadiumBorder(),
                  ),
                  child: const Text('Edit Profile', style: TextStyle(color: Colors.black),),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent Activity',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 10),
                    const ListTile(
                      leading: Icon(Icons.history),
                      title: Text('Rented a house'),
                      subtitle: Text('April 22, 2024'),
                    ),
                    const Divider(),
                    const SizedBox(height: 10),
                    ProfileMenuWidget(title: "Settings", 
                    icon: Icons.settings,
                     onPress: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const SettingsPage(),
                        ),
                        );
                    },),

                    const Divider(),
                    const SizedBox(height: 10),
                    ProfileMenuWidget(
                      title: "Log Out",
                      icon: Icons.logout,
                      onPress: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPress;

  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(title),
          ],
        ),
      ),
    );
  }
}