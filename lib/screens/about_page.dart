import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration:  BoxDecoration(
            image:  DecorationImage(
              image: const AssetImage('assets/images/image8.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.4),
                BlendMode.lighten,
              ),
            ),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Our Mission:',
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'At RentandBuy, our mission is to provide a seamless and convenient platform for individuals to find whatever it is they need be it homes or vehicles, whether through renting or buying. We strive to empower users with the flexibility to choose the option that best fits their needs and lifestyle.'
            ),
            SizedBox(height: 20),
            Text(
              'Company Information:',
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
             SizedBox(height: 5),
             Text(
              'RentandBuy is a leading digital marketplace dedicated to connecting renters, buyers, and sellers in various industries.'
             ),
             SizedBox(height: 20),
             Text(
              'Contact Us:',
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),      
             ),
             SizedBox(height: 5),
             Text(
              'Email: wanjaahope@gmail.com \nPhone: 0746893446'
             ),
             SizedBox(height: 5),
             Text(
              'Values and Philosophy:',
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
             ),
             SizedBox(height: 5),
             Text(
              'At RentandBuy, we believe in transparency, integrity, and customer satisfaction.We are dedicated to upholding the highest standards of service and ethics in everything we do.Our goal is to build lasting relationships with our users based on trust and reliability'
             ),
          ],
        ),
      ),
      ),
    );
  }
}