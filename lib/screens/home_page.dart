import 'package:flutter/material.dart';
import 'package:rent_and_buy/screens/profile_page.dart';
import 'package:rent_and_buy/screens/about_page.dart';
import 'package:rent_and_buy/screens/help_page.dart';
import 'package:rent_and_buy/screens/for_rent.dart';
import 'package:rent_and_buy/screens/for_sale.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
          Stack(
            children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/image3.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            Positioned(
              bottom: 400,
              left: 0,
              right: 0,
         child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => ForRentPage(),
                ),
              );
            },
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
               child: const Image(
                  image: AssetImage("assets/images/image4.jpg"),
                  height: 100,
                  width: 100,
                ),
                ),

                const SizedBox(height: 10),
                const Text('for rent',
                style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
           
          ),
          const SizedBox(width: 60),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) =>  ForSalePage(),
                ),
              );
            },
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
               child: const Image(
                  image: AssetImage("assets/images/image7.jpg"),
                  height: 100,
                  width: 100,
               ),
                ),
                const SizedBox(height: 10),
                const Text('for sale',
                style: TextStyle(fontWeight: FontWeight.bold),
                ),
              
              ],
            ),
          ),
        ],
      ),
    ),
  ],
),

        
      
      drawer: Drawer(
          child: ListView(
            children: [
              const ListTile(
                leading: Icon(Icons.person_2_outlined),
                iconColor: Colors.lightBlue,
                title: Text('Wanjaa'),
                subtitle: Text('My Account'),
              ),
              const SizedBox(height: 25),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.account_circle),
                iconColor: Colors.lightBlue,
                title: const Text('Profile'),
                onTap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const ProfilePage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 5),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.account_circle),
                iconColor: Colors.lightBlue,
                title: const Text('About'),
                onTap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const AboutPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 5),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.account_circle),
                iconColor: Colors.lightBlue,
                title: const Text('Help'),
                onTap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const HelpPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        
      ),
      appBar: AppBar(
        title: const Text(
          'Rent and Buy',
          style: TextStyle(fontSize: 34),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(249, 134, 216, 253),
      ),
    );
  }
}